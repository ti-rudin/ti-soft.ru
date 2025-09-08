import { ref } from 'vue';

const currentLanguage = ref('ru');

function toggleLanguage() {
  currentLanguage.value = currentLanguage.value === 'ru' ? 'en' : 'ru';
}

export { currentLanguage, toggleLanguage };
