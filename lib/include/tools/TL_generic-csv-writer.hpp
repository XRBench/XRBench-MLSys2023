#ifndef TL_GENERIC_CSV_WRITER_HPP_
#define TL_GENERIC_CSV_WRITER_HPP_

#include <iostream>
#include <string>

namespace maestro {
  namespace TL {
    class GenericCSVWriter {
      public:
        GenericCSVWriter(std::string output_file_name) {
          output_file_.open(output_file_name, std::fstream::in | std::fstream::out | std::fstream::app);
        }

        void WriteWord(std::string input_string, bool end_of_line = false) {

          if(!end_of_line) {
            output_file_ << input_string << ",";
          }
          else {
            output_file_ << input_string << std::endl;;
          }
        }

        void WriteVector(std::vector<std::string> input_str_vector, bool end_of_line = false) {
            for(int str_id = 0; str_id < input_str_vector.size(); str_id++) {
              output_file_ << input_str_vector[str_id];
              if(!end_of_line) {
                output_file_ <<  ",";
              }
              else {
                if(str_id == input_str_vector.size()-1) {
                  output_file_ << std::endl;
                }
                else {
                  output_file_ <<  ",";
                }
              }
            }
        }

        void WriteVector(std::vector<double> input_double_vector, bool end_of_line = false) {
            for(int str_id = 0; str_id < input_double_vector.size(); str_id++) {
              output_file_ << std::to_string(input_double_vector[str_id]);
              if(!end_of_line) {
                output_file_ <<  ",";
              }
              else {
                if(str_id == input_double_vector.size()-1) {
                  output_file_ << std::endl;
                }
                else {
                  output_file_ <<  ",";
                }
              }
            }
        }


      protected:
        std::ofstream output_file_;

      private:

    };

  }; // End of namespace TL (Tools)
}; // End of namespace maestro

#endif
