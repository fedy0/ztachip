------------------------------------------------------------------------------
-- Copyright [2014] [Ztachip Technologies Inc]
--
-- Author: Vuong Nguyen
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
-- http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.
------------------------------------------------------------------------------

library std;
use std.standard.all;
LIBRARY ieee;
USE ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

entity SHIFT_RIGHT_L is
   generic
   (
      DIST_WIDTH : natural;
      DATA_WIDTH : natural
   );
   port 
   (
      data_in      : in std_logic_vector((DATA_WIDTH-1) downto 0);
      distance_in  : in unsigned((DIST_WIDTH-1) downto 0);
      data_out     : out std_logic_vector((DATA_WIDTH-1) downto 0)
   );
end SHIFT_RIGHT_L;

architecture rtl of SHIFT_RIGHT_L is
signal input:bit_vector((DATA_WIDTH-1) downto 0);
signal output:bit_vector((DATA_WIDTH-1) downto 0);
begin

input <= To_BitVector(data_in);
output <= input srl to_integer(distance_in);
data_out <= To_StdLogicVector(output);

end rtl;