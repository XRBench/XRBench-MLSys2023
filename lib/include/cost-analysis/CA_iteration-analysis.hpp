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


#ifndef MAESTRO_CA_ITERATION_ANALYSIS_HPP_
#define MAESTRO_CA_ITERATION_ANALYSIS_HPP_

#include <memory>
#include <list>

#include "CA_iterations.hpp"

namespace maestro {
  namespace CA {
    class IterationAnalysis {
      public:
        IterationAnalysis() {
          iterations_ = std::make_shared<std::list<std::shared_ptr<CA::UnitIterationAnalysis>>> ();
        }

        int GetTemporalIteration() {
          int tmp_iter = 1;

          for(auto& it : *iterations_) {
            tmp_iter *= it->GetNumTemporalIteration();
          }

          return tmp_iter;
        }

        int GetSpatialIteration() {
          int sp_iter = 1;

          for(auto& it : *iterations_) {
            sp_iter *= it->GetNumSpatialIteration();
          }
          return sp_iter;
        }

        void AddUnitIterationAnalysis(std::shared_ptr<CA::UnitIterationAnalysis> iteration) {
          iterations_->push_back(iteration);
        }

      protected:
        std::shared_ptr<std::list<std::shared_ptr<CA::UnitIterationAnalysis>>> iterations_;

    }; // End of class IterationAnalysis
  }; // End of namespace CA
}; // End of namespace maestro

#endif
