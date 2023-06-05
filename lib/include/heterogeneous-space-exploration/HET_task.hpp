
#ifndef MAESTRO_HET_TASK_HPP_
#define MAESTRO_HET_TASK_HPP_

#include <vector>
#include <memory>


namespace maestro{
  namespace HET {

    class Task {
      public:
        Task() {
          task_id_vector_ = std::make_shared<std::vector<int>>();
        }

        int GetTopLevelTaskID() {
          if(task_id_vector_->empty()) {
            return -1;
          }
          else {
            return task_id_vector_->at(0);
          }
        }

        int GetGlobalTaskID() {
          if(task_id_vector_->empty()) {
            return -1;
          }

          int ret = 1;
          for (auto& task_id_at_dim : *task_id_vector_) {
            ret *= task_id_at_dim;
          }
          return ret;
        }

        void AddTaskID(int tid_at_lv) {
          task_id_vector_->push_back(tid_at_lv);
        }


      protected:
        std::shared_ptr<std::vector<int>> task_id_vector_;

      private:

    }; // End of class Task

    class ConvTask : public Task {
      public:

        void SetTaskID(int model_id, int layer_id) {
          task_id_vector_->push_back(model_id);
          task_id_vector_->push_back(layer_id);
        }

      protected:

      private:

    }; // End of class ConvTask

    enum class TaskDependence {Independent, Predecessor, Successor, NumTaskDependence};

    template <class TaskClass>
    class TaskInfo {
      public:

        TaskInfo(
            std::shared_ptr<TaskClass> task,
            std::shared_ptr<std::vector<int>> task_id_vector) :
          task_(task),
          task_id_vector_(task_id_vector) {
        }

        int GetTopLevelTaskID() {
          if(task_id_vector_->empty()) {
            return -1;
          }
          else {
            return task_id_vector_->at(0);
          }
        }

        int GetTaskID(int lv) {
          if(lv < task_id_vector_->size()) {
            return task_id_vector_->at(lv);
          }
          else {
            return -1;
          }
        }

        int GetGlobalTaskID() {
          int ret = 1;

          for(auto& task_id_dim: *task_id_vector_) {
            ret *= task_id_dim;
          }

          return ret;
        }

        TaskDependence operator < (TaskInfo& t2) {
          return this->Compare(t2);
        }

        TaskDependence Compare(TaskInfo& t2, int lv = 1) {
          int t1_topid = this->GetTopLevelTaskID();
          int t2_topid = t2.GetTopLevelTaskID();

          if(t1_topid != t2_topid) {
            return TaskDependence::Independent;
          }

          if(task_id_vector_->size() <2) {
            lv = 0;
          }

          int t1_gtid = this->GetTaskID(lv);
          int t2_gtid = t2.GetTaskID(lv);

          if(t1_gtid < t2_gtid) {
            return TaskDependence::Predecessor;
          }
          else {
            return TaskDependence::Successor;
          }
        }

        std::shared_ptr<TaskClass> GetTask() {
          return task_;
        }

      private:
        const int max_layers_per_model_ = 256;

        std::shared_ptr<std::vector<int>> task_id_vector_;
        std::shared_ptr<TaskClass> task_;
    }; // End of class TaskInfo


  }; // End of namespace HET
}; // End of namespace maestro

#endif
