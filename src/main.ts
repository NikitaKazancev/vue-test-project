import { createApp } from 'vue';
import App from './App.vue';
import UI from './components/UI';

import './index.scss';

const app = createApp(App);

UI.forEach(uiComponent => app.component(uiComponent.name, uiComponent));

app.mount('#app');
