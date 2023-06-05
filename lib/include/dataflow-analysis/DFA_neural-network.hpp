/******************************************************************************
Copyright (c) 2019 Georgia Instititue of Technology
Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:
The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

Author : Hyoukjun Kwon (hyoukjun@gatech.edu)
*******************************************************************************/


#ifndef MAESTRO_DFA_NEURAL_NETWORK_HPP_
#define MAESTRO_DFA_NEURAL_NETWORK_HPP_

#include <algorithm>
#include <string>
#include <memory>
#include <vector>

#include "DFA_layer.hpp"

namespace maestro{
  namespace DFA {

    class NeuralNetwork {
      public:

        class iterator {
          private:
            std::shared_ptr<std::vector<std::shared_ptr<Layer>>> iter_layers_;
          public:

            int curr_idx_;

            iterator(std::shared_ptr<std::vector<std::shared_ptr<Layer>>> ptr, int idx) :
              iter_layers_(ptr),
              curr_idx_(idx) {
            }

            iterator operator++() {
              this->curr_idx_++;
              iterator iter = *this;
              return iter;
            }

            std::shared_ptr<Layer>& operator*() {
              return iter_layers_->at(curr_idx_);
            }

            bool operator==(const iterator& rhs) {
              return (this->curr_idx_ == rhs.curr_idx_);
            }

            bool operator!=(const iterator& rhs) {
              return (this->curr_idx_ != rhs.curr_idx_);
            }
        }; // End of class iterator for class NeuralNetwork

        iterator begin() {
          return iterator(layers_, 0);
        }

        iterator end() {
          return iterator(layers_, layers_->size());
        }

        std::shared_ptr<Layer> operator [](int idx) {
          return GetLayer(idx);
        }

        std::shared_ptr<Layer> at (int idx) {
          return GetLayer(idx);
        }

        NeuralNetwork() {
          layers_ = std::make_shared<std::vector<std::shared_ptr<Layer>>>();
          dependency_ = std::make_shared<std::vector<std::string>>();
          trigger_probability_ = 1.0f;
        }

        NeuralNetwork(std::string name) :
          name_(name) {
          layers_ = std::make_shared<std::vector<std::shared_ptr<Layer>>>();
          trigger_probability_ = 1.0f;
        }

        bool operator==(NeuralNetwork& rhs) {
          return (this->GetName() == rhs.GetName());
        }

        void SetDependency(std::string depend_on_model_name) {
          dependency_->push_back(depend_on_model_name);
        }

        bool CheckDependency(std::string model_name) {
          return (
              std::any_of(
                dependency_->begin(),
                dependency_->end(),
                [model_name](std::string search_name){return search_name == model_name;})
            );
        }

        std::string GetName() {
          return name_;
        }

        void SetName(std::string name) {
          name_ = name;
        }

        int GetFPS() {
          return target_fps_;
        }

        void SetFPS(int fps) {
          target_fps_ = (fps > 0)? fps : 1;
        }

        float GetProb() {
          return trigger_probability_;
        }

        void SetProb(float prob) {
          //std::cout << "Setting prob as " << prob << std::endl;
          trigger_probability_ = prob;
          //std::cout << "Result: " << trigger_probability_ << std::endl;
        }


        void AddLayer(std::shared_ptr<Layer> new_layer) {
          if(new_layer == nullptr) {
            std::cout << "Warning: Adding a null ptr" << std::endl;
          }
          layers_->push_back(new_layer);
        }

        int GetNumLayers() {
          return layers_->size();
        }

        std::shared_ptr<std::vector<std::shared_ptr<Layer>>> GetLayerList() {
          return layers_;
        }

        std::shared_ptr<std::vector<std::string>> GetDependencyList() {
          return dependency_;
        }


      protected:
        std::string name_;
        int target_fps_;
        float trigger_probability_;
        std::shared_ptr<std::vector<std::shared_ptr<Layer>>> layers_;
        std::shared_ptr<std::vector<std::string>> dependency_;

      private:
        std::shared_ptr<Layer> GetLayer(int idx) {
          if(idx < layers_->size()) {
            return layers_->at(idx);
          }
          else {
            return nullptr;
          }
        }
    };  // End of class NeuralNetwork

  }; // End of namespace DFA
};  // End of namespace maestro

#endif
