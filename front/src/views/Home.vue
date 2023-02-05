<template>
  <div>
    <h3>Home</h3>
    <button
      @click="getData"
      class="rounded border-b-2 border-gray-500 bg-gray-300 text-gray-700 w-43.75 md:w-28 h-9.5 md:h-8"
    >
      DynamoDB
    </button>
    <div>{{ data }}</div>
  </div>
</template>

<script>
import axios from "axios";

export default {
  data() {
    return {
      data: "",
    };
  },
  methods: {
    async getData() {
      let response = await axios({
        method: "get",
        url: "http://localhost:3000/hello",
      });
      this.data = response;
    },
  },
};
</script>
