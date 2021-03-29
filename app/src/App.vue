<template>
  <div>
    Hi Dunglas! Open the browser console and refresh the page.
  </div>
</template>

<script>
import EventSource from 'eventsource';

export default {
  name: 'App',
  mounted: () => {
    const url = new URL('http://events.foo.localhost:8888/.well-known/mercure?topic=bar');

    const sse = new EventSource(url.toString(), {
      headers: {
        //Authorization: `Bearer FooBar`,
      },
    });

    sse.onmessage = (event) => {
      console.log(event);
    };

    sse.onerror = (event) => {
      console.log(event);

      sse.close();
    };
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
