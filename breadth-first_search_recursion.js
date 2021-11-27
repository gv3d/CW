/* Рекурсивный поиск в ширину (графы)
Представьте, что вы выращиваете манго. Бы ищете продавца, который
будет продавать ваши замечательные манго. Для начала стоит поискать среди
друзей.
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
 * Определяем продавца манго
 * @param {string} name Имена друзей
 * @returns {boolean} Результаты проверки
 */
function search(name, graph) {
  graph = graph || {};
  /**
   * Рекурсивная функция проверки человечков
   * @param {Array} waited Список людей, которых нужно проверить
   * @param {Array} visited Список проверенных людишек
   */
  function inner(waited, visited) {
    waited = waited || [];
    if (waited.length === 0) return false;
    const person = waited[0];
    const waitedCloned = waited.slice(1);
    if (visited.indexOf(person) !== -1) return inner(waitedCloned, visited);
    if (personIsSeller(person)) {
      console.log(person + "- это продавец манго! Хватайте его!");
      return true;
    }
    return inner(waitedCloned.concat(graph[person]), visited.concat(person));
  }
  return inner(graph[name], []);
}

search("you", graph);