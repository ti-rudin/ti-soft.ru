<template>
  <div class="max-w-4xl mx-auto p-6 bg-gray-50 dark:bg-gray-900 min-h-screen">
    <h1 class="text-3xl font-bold mb-6 text-gray-900 dark:text-white">{{ translations.title[currentLanguage] }}</h1>
    <section class="space-y-6 text-gray-700 dark:text-gray-300">
      <article>
        <h2 class="text-2xl font-semibold mb-2">{{ translations.robotDevelopmentTitle[currentLanguage] }}</h2>
        <p>{{ translations.robotDevelopmentDescription[currentLanguage] }}</p>
        <p><strong>{{ translations.technologiesLabel[currentLanguage] }}</strong> UiPath, Blue Prism, Python-скрипты.</p>
      </article>
      <article>
        <h2 class="text-2xl font-semibold mb-2">{{ translations.rpaImplementationTitle[currentLanguage] }}</h2>
        <p>{{ translations.rpaImplementationDescription[currentLanguage] }}</p>
      </article>
      <article>
        <h2 class="text-2xl font-semibold mb-2">{{ translations.integrationTitle[currentLanguage] }}</h2>
        <p>{{ translations.integrationDescription[currentLanguage] }}</p>
      </article>
      <article>
        <h2 class="text-2xl font-semibold mb-2">{{ translations.supportTitle[currentLanguage] }}</h2>
        <p>{{ translations.supportDescription[currentLanguage] }}</p>
      </article>
    </section>
  </div>
</template>

<script>
import { currentLanguage } from '../stores/language';

export default {
  name: 'Services',
  setup() {
    const translations = {
      title: {
        ru: 'Услуги',
        en: 'Services',
      },
      robotDevelopmentTitle: {
        ru: 'Разработка программных роботов',
        en: 'Software Robot Development',
      },
      robotDevelopmentDescription: {
        ru: 'Наши RPA-роботы выполняют рутинные задачи без ошибок: обработка документов, перенос данных, формирование отчетов.',
        en: 'Our RPA robots perform routine tasks without errors: document processing, data transfer, report generation.',
      },
      technologiesLabel: {
        ru: 'Технологии:',
        en: 'Technologies:',
      },
      rpaImplementationTitle: {
        ru: 'Внедрение RPA-решений',
        en: 'RPA Implementation',
      },
      rpaImplementationDescription: {
        ru: 'Аудит процессов → Настройка роботов → Обучение сотрудников → Запуск и мониторинг.',
        en: 'Process audit → Robot setup → Staff training → Launch and monitoring.',
      },
      integrationTitle: {
        ru: 'Интеграция с бизнес-системами',
        en: 'Integration with Business Systems',
      },
      integrationDescription: {
        ru: 'Роботы работают с 1С, SAP, CRM, почтой, Excel и другими инструментами.',
        en: 'Robots work with 1C, SAP, CRM, email, Excel, and other tools.',
      },
      supportTitle: {
        ru: 'Поддержка и оптимизация',
        en: 'Support and Optimization',
      },
      supportDescription: {
        ru: 'Регулярные обновления, исправление ошибок, масштабирование решений.',
        en: 'Regular updates, bug fixes, solution scaling.',
      },
    };

    return {
      currentLanguage,
      translations,
    };
  },
};
</script>
