<template>
    <div class="container mt-5">
        <div class="card text-center">
            <div class="card-header">
                Create A Team
            </div>
            <div class="card-body">
                <h5 class="card-title">Create A New Team</h5>
                <div v-if="successMessage" class="alert alert-success mt-3" role="alert">
                    {{ successMessage }}
                </div>
                <div v-if="errorMessages.length > 0" class="alert alert-danger mt-3" role="alert">
                    <ul>
                        <li v-for="error in errorMessages" :key="error">{{ error }}</li>
                    </ul>
                </div>
                <form @submit.prevent="submitForm">
                    <div class="form-group row mb-3">
                        <label for="amount" class="col-sm-2 col-form-label">Team Name:</label>
                        <div class="col-sm-8">
                            <input
                                type="text"
                                class="form-control"
                                id="name"
                                name="name"
                                v-model="name"
                            />
                        </div>
                    </div>

                    <div class="form-group row mb-3">
                        <label for="amount" class="col-sm-2 col-form-label">Country:</label>
                        <div class="col-sm-8">
                            <input
                                type="text"
                                class="form-control"
                                id="country"
                                name="country"
                                v-model="country"
                            />
                        </div>
                    </div>

                    <div class="form-group row mb-3">
                        <label for="amount" class="col-sm-2 col-form-label">Balance:</label>
                        <div class="col-sm-8">
                            <input
                                type="number"
                                class="form-control"
                                id="country"
                                name="country"
                                v-model="balance"
                            />
                        </div>
                    </div>

                    <hr>
                    <div v-for="(player, index) in players" :key="index" class="mb-4">
                        <div class="form-group row mb-3 border-4">
                            <label for="amount" class="col-sm-2 col-form-label">Player First Name:</label>
                            <div class="col-sm-3">
                                <input
                                    type="text"
                                    class="form-control"
                                    v-model="player.firstName"
                                />
                            </div>

                            <label for="amount" class="col-sm-2 col-form-label">Player Last Name:</label>
                            <div class="col-sm-3 mb-2">
                                <input
                                    type="text"
                                    class="form-control"
                                    v-model="player.lastName"
                                />
                            </div>
                        </div>
                    </div>
                    <div class="form-group row mb-3" style="justify-content: center">
                        <button type="button" class="btn btn-primary" @click="addPlayer" style="margin-right: 20px; width: 10%;">Add More</button>
                        <button type="button" class="btn btn-primary" @click="removePlayer" style="margin-right: 20px; width: 10%;">Remove</button>
                    </div>
                    <hr>

                    <button type="submit" class="btn btn-primary" style="margin-right: 20px;">Add Team</button>

                    <a href="/home" class="btn btn-primary"
                    >Go Home</a>
                </form>

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
            name:"",
            country:"",
            balance: 0.00,
            players: [{ firstName: "", lastName: "" }],
            team: {},
            allTeams: {},
            errorMessages: [],
            successMessage: ""
        };
    },
    async created() {
    },
    methods: {
        validateForm() {
            if (this.name == "" || this.country == "") {
                alert('Please enter all fields before proceeding.');
                return false;
            }

            return true;
        },
        addPlayer() {
            this.players.push({ firstName: "", lastName: "" });
        },
        removePlayer() {
            if (this.players.length > 1) {
                this.players.pop();
            }
        },
        async submitForm() {
            try {
                if (!this.validateForm()) return;
                const response = await axios.post("/teams", {
                    name: this.name,
                    country: this.country,
                    balance: this.balance,
                    players: this.players,
                });

                if (response.data.message === "Validation failed!") {
                    this.errorMessages = response.data.errors;
                }

                if(response.data.message === "Team created successfully"){
                    this.successMessage = response.data.message;
                    this.resetForm();
                    setTimeout(() => {
                        this.successMessage = null;
                    }, 5000);
                }
            } catch (error) {
                console.error("Error submitting form:", error);
            }
        },
        resetForm() {
            this.name="";
            this.country="";
            this.balance="";
            this.players = [{ firstName: "", lastName: "" }];
        },
    },
};
</script>
