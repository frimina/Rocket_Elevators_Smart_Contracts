<template>
  <div id="visa">
      <br>
      <br>
    <h1>Input your project</h1>
    <form>
      <label for="first name"> Battery:</label>
      <input type="number" required>
      <br>
      <label for="last name"> Columns:</label>
      <input type="number" required>
      <br>
      <label for="country">Elevators:</label>
      <input type="number"  required>
      <br>
      <label for="passport number">Floor:</label>
      <input type="number"  required>

     
     <br><br>
      <button>Submit</button>
      <br>
      
    </form>
</div>
</template>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
#visa {
  margin: 20px auto;
  max-width: 700px;
}
label{
  display: block;
  margin: 20px 0 10px;
}
input {
  font-size: 30px;
  border: 1px double rgb(102, 97, 96) ;
  border-radius: 4px;
}
button {
  font-size: 16px;
 background: rgb(209, 65, 73);
  padding: 0.4rem 1.3rem;
  text-align: center;
  border: none;
  cursor: pointer;
  border-radius: 4px;
 margin: 10px;
}
span{
  width: 30px;
  float: right;
  cursor: pointer;
}
span:hover{
  color: brown;
}
.previous{
  border: 1.5px solid;
  padding:5px;
  margin-bottom: 10px;
}
</style>