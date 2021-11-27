"use strict";

/**
 * Быстрая сортировка массива O(n log n)
 * @param {Array} array Исходный массив
 * @returns {Array} Отсортированный массив
 */
function quicksort(array) {
  // базовый случай: массив с 0 или 1 элементом уже отсортированы:
  if (array.length < 2) return array;
  // "рекурсивный" случай:
  let pivot = array[0];
  // подмассив всех элементов меньше исходного:
  let less = array.slice(1).filter(function(el) {
    return el <= pivot;
  });
  // подмассив всех элементов больше исходного:
  let greater = array.slice(1).filter(function(el) {
    return el > pivot;
  });
  return quicksort(less).concat([pivot], quicksort(greater));
}

console.log(quicksort([10, 5, 2, 3])); // >> [2, 3, 5, 10]