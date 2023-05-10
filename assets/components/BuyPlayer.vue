<template>
    <div class="container mt-5">
        <div class="card text-center">
            <div class="card-header">
                Players
            </div>
            <div class="card-body">
                <h5 class="card-title">Select the player you will like to buy or sell ?</h5>
                <form @submit.prevent="submitForm">
                    <div class="form-group row mb-3">
                        <label for="amount" class="col-sm-2 col-form-label">Current Team:</label>
                        <div class="col-sm-8">
                            <input
                                type="text"
                                class="form-control"
                                id="teamName"
                                name="currentTeam"
                                v-model="team.name"
                                readonly
                            />
                        </div>
                    </div>

                    <input
                        type="hidden"
                        class="form-control"
                        id="teamBalance"
                        name="currentTeam"
                        v-model="team.balance"
                        readonly
                    />

                    <div class="form-group row mb-3">
                        <label for="staticTransaction" class="col-sm-2 col-form-label">Transaction</label>
                        <div class="col-sm-8">
                            <select class="form-control" id="transactionType" v-model="transactionType">
                                <option value="">-- Select a Transaction Type --</option>
                                <option>Buying</option>
                                <option>Selling</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group row mb-3">
                        <label for="staticPlayer" class="col-sm-2 col-form-label">Select Player</label>
                        <div class="col-sm-8">
                            <select
                                class="form-control"
                                name="playerSelected"
                                id="selectPlayer"
                                v-model="selectedPlayer"
                            >
                                <option value="">-- Select a player to Transact --</option>
                                <option v-for="player in filteredPlayers" :key="player.id" :value="player.id">
                                    {{ player.firstName }} {{ player.lastName }}
                                </option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group row mb-3">
                        <label for="staticTransaction" class="col-sm-2 col-form-label">{{ transactionLabel }}</label>
                        <div class="col-sm-8">
                            <select class="form-control" id="offerorTeam" v-model="offerorTeam">
                                <option value="">-- Select an Offeror For this Transaction --</option>
                                <option v-for="offeror in filteredTeams" :key="offeror.id" :value="offeror.id">
                                    {{ offeror.name }}
                                </option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group row mb-3">
                        <label for="amount" class="col-sm-2 col-form-label">Amount</label>
                        <div class="col-sm-8">
                            <input type="number" class="form-control" id="amount" v-model="amount" placeholder="500">
                        </div>
                    </div>

                    <button type="submit" class="btn btn-primary" style="margin-right: 20px;">Buy/Sell Player</button>

                    <a href="/home" class="btn btn-primary"
                    >Go Home</a>
                </form>

                <div v-if="successMessage" class="alert alert-success mt-3" role="alert">
                    {{ successMessage }}
                </div>

            </div>
            <div class="card-footer text-muted">
                Powered by moses egboh
            </div>
        </div>
    </div>
</template>
<script>
import axios from "axios";

export default {
    data() {
        return {
            team: {},
            allTeams: {},
            allPlayers: {},
            selectedPlayer: "",
            transactionType: "",
            amount: 0.00,
            successMessage: null,
            offerorTeam: "",
        };
    },
    async created() {
        try {
            const teamId = this.$route.query.teamId;
            const [teamResponse, allTeamsResponse, allPlayersResponse] = await Promise.all([
                axios.get(`/team/${teamId}`),
                axios.get('/teams'),
                axios.get('/players')
            ]);

            this.team = teamResponse.data;
            this.allTeams = allTeamsResponse.data;
            this.allPlayers = allPlayersResponse.data

        } catch (error) {
            console.error("Error fetching team:", error);
        }
    },
    computed: {
        transactionLabel() {
            return this.transactionType === "Buying" ? "Buying from" : "Selling To";
        },
        filteredPlayers() {
            if (this.transactionType === "Buying") {
                return this.allPlayers.filter(player => !this.idExists(this.team.players, player.id));
            } else if (this.transactionType === "Selling") {
                return this.allPlayers.filter(player => this.idExists(this.team.players, player.id));
            } else {
                return [];
            }
        },
        filteredTeams() {
            if (!this.selectedPlayer || !this.transactionType) {
                return [];
            }

            const playerTeam = this.allTeams.find(team => team.players.some(player => player.id === this.selectedPlayer));

            if (!playerTeam) {
                return this.allTeams;
            }

            if (this.transactionType === "Buying") {
                return this.allTeams.filter(team => team.id !== this.team.id && team.id === playerTeam.id);
            } else if (this.transactionType === "Selling") {
                return this.allTeams.filter(team => team.id !== this.team.id);
            } else {
                return [];
            }
        },
    },
    methods: {
        validateForm() {
            if (this.amount === 0.00 || this.selectedPlayer === "" || this.transactionType === "") {
                alert('Please enter all fields before proceeding.');
                return false;
            }

            if (this.idExists(this.team.players, this.selectedPlayer) && this.transactionType === "Buying") {
                alert('You cannot buy a player you already have or sell a player to yourself');
                return false;
            }

            if (!this.idExists(this.team.players, this.selectedPlayer) && this.transactionType === "Selling") {
                alert('You cannot sell a player you do not have');
                return false;
            }

            if (this.amount > this.team.amount) {
                alert('You do not have sufficient balance to make this purchase.');
                return false;
            }
            return true;
        },
        async submitForm() {
            try {
                if (!this.validateForm()) return;
                const response = await axios.post("/teams/buy-sell-player", {
                    teamId: this.team.id,
                    playerId: this.selectedPlayer,
                    transactionType: this.transactionType,
                    offeror: this.offerorTeam,
                    amount: this.amount,
                });

                this.successMessage = response.data.message;
                this.resetForm();
                setTimeout(() => {
                    this.successMessage = null;
                }, 5000);
            } catch (error) {
                console.error("Error submitting form:", error);
            }
        },
        resetForm() {
            this.selectedPlayer = null;
            this.transactionType = null;
            this.offerorTeam = null;
            this.amount = null;
        },
         idExists(arrayOfObjects, targetId) {
            for (let i = 0; i < arrayOfObjects.length; i++) {
                if (arrayOfObjects[i].id === targetId) {
                    return true;
                }
            }
            return false;
        }
    },
};
</script>
