//first, create the blueprint for Nodes by creating a Node class
class Node {
  constructor(data){
    this.data = data
    this.next = null
  }
}
​
//let's create our first node!
const apple = new Node("apple")
// console.log(apple)
​
​
//okay, let's make another one
const watermelon = new Node("watermelon")
// console.log(watermelon)
​
​
//they're not related to each other!! let's fixed that
apple.next = watermelon
// console.log(apple)
​
//let's chain another node
apple.next.next = new Node("pineapple")
// console.log(apple)
​
​
​
//this is a bit tedious. Let's create a linked list blue print to make this more organized and useable
class SinglyLinkedList{
  constructor(){
    this.head = null
    this.tail = null
    this.length = 0
  }
  push(data){ 
    //function takes in an argument
    //create new node using the argument passed in
    //if no head exists, set the head and tail to be this new node
    //else, set the next property of the tail to be the new node 
    //set the tail to be this new node
    //increment length by 1
    //return the linked list
    const newNode = new Node(data) 
    if (!this.head){ 
      this.head = newNode
      this.tail = this.head
    }else {
      this.tail.next = newNode
      this.tail = newNode
    }
    this.length += 1 
    return this
  }
  pop(){
    //to pop, you must traverse the linked list
    //if the list is empty, return undefined
    //create two variables to store the "current" node, and the next value of that node
    //as long as the current node has a next property, make that node the new tail and check if the next node also has a next property
    //if the next node does not have a next property, the newtail remains to be the previous node
    if (!this.head) return undefined
    let current = this.head 
    let newTail = current  
    while(current.next){
      newTail = current
      current = current.next
    }
    console.log("former tail: ", current)
    console.log("new tail ", newTail)
    this.tail = newTail
    this.tail.next = null
    this.length --
​
    if(this.length === 0){
      this.head = null
      this.tail = null
    }
​
    //return the "popped" value 
    return current
​
  }
​
  traverse(){
    let current = this.head
    while (current){
      console.log(current.data)
      current = current.next
    }
  }
  shift() {
    //if no node, return undefined
    //store current head in variable
    //set head to be the current head's next
    //decrement the length by 1
    //set tail to null if the list is empty 
    //return the value of the node removed 
    if(!this.head) return undefined
    const oldHead = this.head
    this.head = oldHead.next
    this.length --
    if(this.length === 0){
      this.tail = null
    }
    return oldHead
​
  }
  unshift(data) {
    //function accepts argument
    //create new node with argument
    //if no head, set head and tail to be the new nodes
    //else set the new node's next property to be the current head property on the list
    //set the head to be the newly created node
    //increment length by one
    //return list
    const newHead = new Node(data)
    if(!this.head){
      this.head =  newHead
      this.tail = this.head
    }else{
      newHead.next = this.head
      this.head = newHead
    }
    this.length ++
    return this
    
  }
  get(index){
    //function accepts index
    //if index is >= the length or is less than 0, return undefined
    //loop through the list until you reach the index and return the node at that index
    if( index >= this.length || index < 0 ) return undefined 
    let counter = 0
    let current = this.head
    while (counter !== index){
      current = current.next
      counter ++
    }
    return current 
  }
  //change the value of a node
  set(index, newData){
    let current = this.get(index)
    if(current){
      current.data = newData
      return true
    }
    return false
    
  }
​
  //add a node at a specific point in the linked list
  insert(index, data){
    if(index >= this.length || index < 0) return false
    if(index === 0 ){
      return this.unshift(newNode)
    }
    if(index === this.length){
      return this.push(newNode)
    }
    const newNode = new Node(data)
    const prevNode = this.get(index - 1)
    const nextNode = prevNode.next
    prevNode.next = newNode
    newNode.next = nextNode
    return true
  }
  //remove a node from the list
  remove(index){
    if(index < 0 || index >= this.length) return undefined
    if(index === 0) return this.shift()
    if(index === this.length-1) return this.pop()
    const prevNode = this.get(index - 1);
    const removed = prevNode.next
    prevNode.next = removed.next
    this.length--
    return removed
​
  }
​
  //find the node where the data === a certain value
  search(data){
    if(!this.head) return undefined
    let current = this.head
    let index = 0
    while(current.next){
      if(current.data === data) return index;
      index ++
      current = current.next
    }
    return current.data === data ? index : false
  }
}