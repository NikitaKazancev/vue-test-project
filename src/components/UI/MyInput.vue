<script setup lang="ts">
import { onUnmounted, ref } from 'vue';

const props = defineProps<{
	type: 'text' | 'number';
	modelValue: string | number;
	id: string;
	bgColor: string;
	error: boolean;
}>();
const emits = defineEmits<{
	(e: 'enter', event: KeyboardEvent): void;
	(e: 'update:modelValue', value: string | number): void;
	(e: 'update:error', value: boolean): void;
}>();

onUnmounted(() => {
	emits('update:modelValue', '');
	emits('update:error', false);
});

const updateInput = (e: Event): void => {
	const target = e.target as HTMLInputElement;
	emits('update:modelValue', target.value);
	emits('update:error', false);
};
</script>

<template>
	<div class="inputGroup">
		<input
			@keydown.enter="(e: KeyboardEvent) => emits('enter', e)"
			@input="updateInput"
			:class="[
				'input',
				error ? 'input_error' : '',
				modelValue ? 'input_success' : '',
			]"
			:type="type"
			:value="modelValue"
			:id="id"
			required
		/>
		<label :for="id">Name</label>
	</div>
</template>

<style lang="scss" scoped>
.inputGroup {
	font-family: 'Segoe UI', sans-serif;
	max-width: 190px;
	position: relative;
	margin-top: 0.5em;

	.input {
		font-size: 100%;
		padding: 0.5em;
		outline: none;
		border: 2px solid #000;
		transition: 0.2s;
		background-color: transparent;
		border-radius: 20px;
		width: 100%;

		&_error {
			border: 2px solid red;
		}

		&_success {
			border: 2px solid green;
		}
	}

	label {
		font-size: 100%;
		position: absolute;
		left: 0;
		padding: 0.5em;
		margin-left: 0.5em;
		pointer-events: none;
		-webkit-transition: all 0.3s ease;
		transition: all 0.3s ease;
		color: rgb(100, 100, 100);
	}

	:is(input:focus, input:valid) ~ label {
		-webkit-transform: translateY(-50%) scale(0.9);
		-ms-transform: translateY(-50%) scale(0.9);
		transform: translateY(-50%) scale(0.9);
		margin: 0em;
		margin-left: 1em;
		padding: 0 0.4em;
		background-color: v-bind(bgColor);
	}
}
</style>
