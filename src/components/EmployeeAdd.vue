<script setup lang="ts">
import type { Employee } from '@/App.vue';
import { reactive } from 'vue';
import MyInput from './UI/MyInput.vue';
import MyModal from './UI/MyModal.vue';

defineProps<{ modalShow: boolean }>();
const emits = defineEmits<{
	(e: 'add', item: Employee): void;
	(e: 'toggleModal'): void;
}>();

type EmployeeCheckProps = {
	[prop in keyof Employee as Exclude<
		`error${Capitalize<prop>}`,
		'errorId'
	>]: boolean;
};

let freeId: number = 3;
const state = reactive<Employee & EmployeeCheckProps>({
	name: '',
	salary: '',
	errorName: false,
	errorSalary: false,
	id: freeId,
});

const checkInputNode = (node: Node): node is HTMLInputElement => {
	return (node as HTMLInputElement).value !== undefined;
};

const toNextByEnter = (e: KeyboardEvent): void => {
	const target = e.target as HTMLElement;
	if (
		target.parentElement &&
		target.parentElement.nextSibling &&
		checkInputNode(target.parentElement.nextSibling.childNodes[0])
	) {
		target.parentElement.nextSibling.childNodes[0].focus();
	}
};

const submit = (): void => {
	if (!state.name || !state.salary) {
		if (!state.name) state.errorName = true;
		if (!state.salary) state.errorSalary = true;
		return;
	}

	emits('add', { id: freeId++, name: state.name, salary: state.salary });
	emits('toggleModal');
	state.salary = '';
	state.name = '';
};
</script>

<template>
	<MyModal v-if="modalShow" @click="() => emits('toggleModal')">
		<h2>Добавить сотрудника</h2>
		<form :class="$style.postAdd">
			<MyInput
				@enter="toNextByEnter"
				type="text"
				v-model="state.name"
				v-model:error="state.errorName"
				id="name"
				bg-color="antiquewhite"
			/>
			<MyInput
				@enter="submit"
				type="number"
				v-model="state.salary"
				v-model:error="state.errorSalary"
				id="salary"
				bg-color="antiquewhite"
			/>
		</form>
	</MyModal>
	<button @click="() => emits('toggleModal')">Добавить сотрудника</button>
</template>

<style lang="scss" module>
.postAdd {
	display: flex;
	padding: 10px;
	border: 1px solid #000;
	display: inline-flex;
	gap: 10px;
	margin-top: 10px;
}
</style>
