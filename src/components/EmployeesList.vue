<script lang="ts" setup>
import type { Employee } from '@/App.vue';
import EmployeeItem from '@/components/EmployeeItem.vue';
import { computed } from 'vue';

const props = defineProps<{ list: Employee[] }>();

const sortedList = computed((): Employee[] =>
	[...props.list].sort((a: Employee, b: Employee) => {
		if (a.name.toLowerCase() < b.name.toLowerCase()) return -1;
		else return 1;
	})
);

const emits = defineEmits<{ (e: 'remove', id: number): void }>();

const removeItem = (e: MouseEvent): void => {
	const target = e.target as HTMLElement;

	if (target.matches('i[data-id]')) {
		const id = target.getAttribute('data-id');
		if (id) {
			emits('remove', parseInt(id));
		}
	}
};
</script>

<template>
	<ul
		:class="$style.employeesList"
		@click="removeItem"
		v-if="sortedList.length"
	>
		<EmployeeItem
			v-for="employee in sortedList"
			:key="employee.id"
			:employee="employee"
		/>
	</ul>
	<h2 v-else>Нет сотрудников</h2>
</template>

<style module lang="scss">
.employeesList {
	padding: 10px;
	border: 1px solid #000;
	display: inline-flex;
	flex-direction: column;
	gap: 10px;
}
</style>
