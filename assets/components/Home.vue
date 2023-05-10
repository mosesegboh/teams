<template>
    <div class="container mt-5">
        <div class="card text-center">
            <div class="card-header">
                Players
            </div>
            <div class="card-body">
                <h5 class="card-title">Buy/Sell A Player</h5>
                <table class="table table-striped table-hover">
                    <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Name</th>
                        <th scope="col">Country</th>
                        <th scope="col">Balance</th>
                        <th scope="col">Players</th>
                        <th scope="col">Select</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr v-for="(team, index) in items" :key="team.id">
                        <th scope="row">{{ index + 1 }}</th>
                        <td>{{ team.name }}</td>
                        <td>{{ team.country }}</td>
                        <td>{{ team.balance }}</td>
                        <td>
                            {{
                            Array.isArray(team.players)
                                ? team.players.map(player => player.firstName + ' ' + player.lastName).join(', ')
                                : 'No players'
                            }}
                        </td>
                        <td>
                            <input
                                class="form-check-input"
                                type="radio"
                                name="selectedTeam"
                                :id="'selectedTeam' + team.id"
                                :value="team.id"
                                v-model="selectedTeam"
                            />
                        </td>
                    </tr>
                    </tbody>
                </table>

                <a href="#"
                   class="btn btn-primary"
                   style="margin-right: 20px;"
                   @click.prevent="buyPlayer"
                >Buy/Sell Player</a>

                <a href="#"
                   class="btn btn-primary"
                   style="margin-right: 20px;"
                   @click.prevent="addNewTeam"
                >Add A New Team</a>

            </div>
            <div class="card-footer text-muted">
                Powered by moses egboh
            </div>
        </div>

        <div class="mt-3">
            <nav aria-label="Page navigation">
                <ul class="pagination justify-content-center">
                    <li class="page-item" :class="{ disabled: currentPage === 1 }">
                        <a class="page-link" href="#" @click.prevent="changePage(currentPage - 1)">Prev</a>
                    </li>
                    <li class="page-item" v-for="page in totalPages" :key="page" :class="{ active: page === currentPage }">
                        <a class="page-link" href="#" @click.prevent="changePage(page)">{{ page }}</a>
                    </li>
                    <li class="page-item" :class="{ disabled: currentPage === totalPages }">
                        <a class="page-link" href="#" @click.prevent="changePage(currentPage + 1)">Next</a>
                    </li>
                </ul>
            </nav>
        </div>

    </div>
</template>

<script>
import axios from 'axios';
import addTeam from "./AddTeam.vue";

export default {
    computed: {
        addTeam() {
            return addTeam
        }
    },
    data() {
        return {
            items: [],
            selectedTeam: null,
            currentPage: 1,
            totalPages: 0,
            perPage: 10
        };
    },
    async created() {
        try {
            const response = await axios.get(`/teams?page=${this.currentPage}&limit=${this.perPage}`);
            this.items = response.data;
            this.totalPages = response.data.totalPages;
        } catch (error) {
            console.error('Error fetching teams:', error);
        }
    },
    methods: {
        validateSelection() {
            if (!this.selectedTeam) {
                alert('Please select a team before proceeding.');
                return false;
            }
            return true;
        },
        buyPlayer() {
            if (!this.validateSelection()) return;
            this.$router.push({ name: 'buy-player', query: { teamId: this.selectedTeam } });
        },
        addNewTeam() {
            this.$router.push({ name: 'add-team'});
        },
        async changePage(page) {
            if (page < 1 || page > this.totalPages) return;
            this.currentPage = page;
            console.log(this.currentPage)
            try {
                const response = await axios.get(`/teams?page=${this.currentPage}&limit=${this.perPage}`);
                this.items = response.data;
            } catch (error) {
                console.error('Error fetching teams:', error);
            }
        },
    },
}
</script>
