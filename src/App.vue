<script setup lang="ts">
import { ref } from 'vue';
import EmployeeAdd from './components/EmployeeAdd.vue';
import EmployeesList from './components/EmployeesList.vue';

export interface Employee {
	name: string;
	salary: string;
	id: number;
}

let employeesList = ref<Employee[]>([
	{ name: 'Mark', salary: '1000', id: 0 },
	{ name: 'Nike', salary: '2000', id: 1 },
	{ name: 'Sam', salary: '5000', id: 2 },
]);

const addEmployee = (item: Employee): void => {
	employeesList.value.push(item);
};

const removeEmployee = (id: number): void => {
	employeesList.value = employeesList.value.filter(
		employee => employee.id != id
	);
};

let modalShow = ref<boolean>(false);
const toggleModal = (): void => {
	modalShow.value = !modalShow.value;
};
</script>

<template>
	<main class="main">
		<EmployeeAdd
			@add="addEmployee"
			:modal-show="modalShow"
			@toggle-modal="toggleModal"
		/>
		<hr />
		<EmployeesList :list="employeesList" @remove="removeEmployee" />
	</main>
</template>

<style scoped lang="scss">
.main {
	width: 90vw;
	min-height: 100%;
	background-color: aquamarine;
	display: inline-flex;
	flex-direction: column;
	align-items: flex-start;
	padding: 20px;
	gap: 10px;
}
</style>
