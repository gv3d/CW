'use strict';
/** Сортировка выбором - О(n^2)
 *
 * Дано: рандомный массив
 * 1. Найдем минимальное значение в массиве:
*/

function findSmallestIndex(array) {
  var smallestElement = array[0]; // Хранит наименьшее значение
  var smallestIndex = 0; // Хранит индекс наименьшего значения

  for (var i = 1; i < array.length; i++) {
    if (array[i] < smallestElement) {
      smallestElement = array[i];
      smallestIndex = i;
    }
  }

  return smallestIndex;
}

/** 2. Сортируем массив:
 *
 * @param array
 * @returns {*[]}
 */
function selectionSort(array) {
  var sortedArray = [];
  var length = array.length;

  for (var i = 0; i < length; i++) {
    // Находит наименьший элемент массива и ..
    var smallestIndex = findSmallestIndex(array);
    // .. добавляет его в новый массив
    sortedArray.push(array.splice(smallestIndex, 1)[0]);
  }

  return sortedArray;
}

console.log(selectionSort([5, 3, 6, 2, 10])); // >> [2, 3, 5, 6, 10]