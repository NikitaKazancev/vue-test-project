<script lang="ts" setup>
const emits = defineEmits<{ (e: 'click'): void }>();
</script>

<template>
	<div :class="$style.modal" @click="() => emits('click')">
		<div :class="$style.content" @click.stop>
			<slot></slot>
		</div>
	</div>
</template>

<style lang="scss" module>
.modal {
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background-color: rgba(#000, 0.5);
	display: flex;
	justify-content: center;
	align-items: center;

	.content {
		background-color: antiquewhite;
		padding: 20px;
		border-radius: 10px;
	}
}
</style>
