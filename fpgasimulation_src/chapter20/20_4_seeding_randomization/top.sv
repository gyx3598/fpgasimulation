/*************************************************************************
   Copyright 2008 Ray Salemi

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
**************************************************************************/
class even_parity;
   rand logic [4:0] data; // bit 4 is the parity bit
   
   function new (int seed);
      $display;
      $display ("setting seed to %0d in new()", seed);
      $display;
      srandom(seed);
   endfunction
      
   function void pre_randomize();
     $display ("data before randomize: %5b", data);
   endfunction
   
   function void post_randomize(); 
     data[4] = ^data[3:0];
   endfunction
endclass

module top;

   even_parity ep;
   
   initial begin
       ep = new(5);       
       for (int i=1; i<=4; i++) begin
          ep.randomize();
          $display ("data after  randomize: %5b", ep.data);
          if (i == 1)
          $display ("                       ^^^^^");

          $display;
       end // for
       ep.srandom(5);
       assert(ep.randomize());
       $display;
       $display ("resetting seed to 5");
       $display ("data after  randomize: %5b", ep.data);
       $display ("                       ^^^^^");
       $display ("Note the same first number");
       
    end // initial 
endmodule

