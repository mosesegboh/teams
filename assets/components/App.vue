<template>
    <Header />
    <router-view></router-view>
</template>

<script>
import Header from "./Header.vue";
import {defineComponent} from "vue";

export default defineComponent({
    components: {Header}
})

</script>
