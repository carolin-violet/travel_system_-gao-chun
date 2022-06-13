/*
随机取数组中的几个数并返回新数组
* @Params list: 给的一个数组
* @Params num: 随机取的总数
* */
export function getRandomList(list, num) {
  let newList = []
  while (num) {
    // 取(0,list.length)之前的随机整数
    let val = Math.floor(Math.random()*list.length)

    if (!newList.includes(list[val])) {
      newList.push(list[val])
      num--
    }
  }
  return newList
}

/*
填充数组至指定长度
* @Params list: 给的一个数组
* @Params num: 数组要达到的长度
* */
export function fillList(list, num) {
  while (list.length < num) {
    list.push('@/assets/images/bg1.webp')
  }
  return list
}
