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


#ifndef MAESTRO_TL_MESSAGE_PRINTER_HPP_
#define MAESTRO_TL_MESSAGE_PRINTER_HPP_

#include <iostream>

namespace maestro {
  namespace TL {
    class MessagePrinter {
      public:
        MessagePrinter(int target_lv) : print_lv_(target_lv) {
        }

        void PrintMsg(int lv, std::string msg, bool change_line = true) {
          if(lv <= print_lv_) {
            if(change_line) {
              std::cout << msg << std::endl;
            }
            else {
              std::cout << msg;
            }
          }
        }

        void SetPrintLv(int new_lv) {
          print_lv_ = new_lv;
        }

      protected:
        int print_lv_= 0;
    };


  };
};

#endif
