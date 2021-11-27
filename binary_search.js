/*
Бинарный посик - О(log n)
 */
function binarySearch(value, list) {
    let first = 0;    //левая конечная точка
    let last = list.length - 1;   //правая конечная точка
    let position = -1;
    let found = false;
    let middle;

    while (found === false && first <= last) {
        middle = Math.floor((first + last)/2);
        if (list[middle] == value) {
            found = true;
            position = middle;
        } else if (list[middle] > value) {  //если в нижней половине нашего списка
            last = middle - 1;
        } else {  // если в правой половине
            first = middle + 1;
        }
    }
    return position;
}