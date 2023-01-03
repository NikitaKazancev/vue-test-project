<script lang="ts" setup>
import type { Employee } from '@/App.vue';

const props = defineProps<{ employee: Employee }>();
</script>

<template>
	<li :class="$style.post">
		<span
			>Имя: <strong>{{ employee.name }}</strong></span
		>
		<span
			>Зарплата: <strong>{{ employee.salary }}</strong></span
		>
		<i :data-id="employee.id">❌</i>
	</li>
</template>

<style lang="scss" module>
.post {
	display: inline-flex;
	align-items: center;
	gap: 10px;

	span {
		min-width: 200px;
	}

	i {
		font-size: 20px;
		color: red;
		cursor: pointer;
	}
}
</style>
