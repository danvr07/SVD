## Copyright (C) 2021 Andrei
##
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <https://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {} {@var{retval} =} KNN (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Andrei <Andrei@DESKTOP-PK505U9>
## Created: 2021-08-09

function prediction = KNN(labels, Y, test, k)
  % initializeaza prediction
  prediction = -1;
  
  % initializeaza distantele
  [m, ~] = size(Y);
  distances = zeros(m, 1);
  
  % Calcularea distantei Euclidiene între fiecare rând din setul de antrenare Y și vectorul de test
  for i = 1:m
    % Calculați distanța Euclidiană între Y(i, :) și test și stocați rezultatul în distances(i)
    difference = Y(i, :) - test;
    squared_difference = power(difference, 2);
    sum_squared_difference = sum(squared_difference);
    distances(i) = sqrt(sum_squared_difference);
  endfor
  
  % Ordonarea crescătoare a distanțelor și păstrarea primelor k valori
  [~, indici] = sort(distances);
  k_n_labels = labels(indici(1:k));
  
  % Calcularea predicției ca modul celor k valori cele mai apropiate
  prediction = mode(k_n_labels);
endfunction

