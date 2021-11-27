/* Поиск в ширину (графы)
Представьте, что вы выращиваете манго. Бы ищете продавца, который
будет продавать ваши замечательные манго. Для начала стоит поискать среди
друзей.
 */

/*
Сначала нужно построить список друзей для поиска
 */
const graph = {};
graph["you"] = ["alice", "bob", "claire"];
graph["bob"] = ["anuj", "peggy"];
graph["alice"] = ["peggy"];
graph["claire"] = ["thom", "jonny"];
graph["anuj"] = [];
graph["peggy"] = [];
graph["thom"] = [];
graph["jonny"] = [];

/**
 * Определяем продавца
 * @param {string} name Имена друзей
 * @returns {boolean} Результаты проверки
 */
function personIsSeller(name) {
  return name[name.length - 1] === "m";
}

/**
 * Определяем продавца
 * @param {string} name Имена друзей
 * @returns {boolean} Результаты поиска
 */
function search(name) {
  let search_queue = [];
  search_queue = search_queue.concat(graph[name]);
  // Этот массив помагает увидеть каких людей вы уже искали раньше
  const searched = [];
  while (search_queue.length) {  // пока очередь пуста..
    let person = search_queue.shift();  // .. из очереди извлекем первого человечка
    // Ищем этого друзяшку, только если мы еще его не искали
    if (searched.indexOf(person) === -1) {
      if (personIsSeller(person)) {
        console.log(person + "- это продавец манго! Хватайте его!");
        return true;
      }

      search_queue = search_queue.concat(graph[person]);
      // Пометим этого челика как
      searched.push(person);
    }
  }
  return false; // если выполнение дошло до этой строчки, значит в очереди нету нашего продавца (убёг наверное)
}

search("you"); // Том это продавец манго!