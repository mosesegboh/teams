import { createRouter, createWebHistory } from 'vue-router';
import BuyPlayer from './components/BuyPlayer.vue';
import Home from './components/Home.vue';
import AddTeam from './components/AddTeam.vue';

const routes = [
    {
        path: '/',
        redirect: 'home'
    },
    {
        path: '/home',
        component: Home,
        name: 'home',
    },
    {
        path: '/buy-player',
        component: BuyPlayer,
        name: 'buy-player',
    },
    {
        path: '/add-team',
        component: AddTeam,
        name: 'add-team',
    },
];

const router = createRouter({
    history: createWebHistory(),
    routes,
});

export default router;
