<template>
  <div class="max-w-6xl mx-auto p-6 bg-gray-50 dark:bg-gray-900 min-h-screen text-gray-700 dark:text-gray-300">
    <!-- Hero Section -->
    <section class="mb-16 text-center">
      <h1 class="text-4xl md:text-5xl font-bold mb-6 text-gray-900 dark:text-white animate-fade-in-down">
        {{ translations.title[currentLanguage] }}
      </h1>
      <p class="text-xl text-gray-600 dark:text-gray-300 max-w-3xl mx-auto">
        {{ translations.subtitle[currentLanguage] }}
      </p>
    </section>

    <!-- Products Section -->
    <section class="mb-16">
      <h2 class="text-2xl font-semibold mb-8 text-center text-gray-900 dark:text-white">
        {{ translations.productsTitle[currentLanguage] }}
      </h2>
      
      <div class="grid gap-8">
        <!-- Product 0 -->
        <router-link to="/auto-service-ai"
          class="bg-white dark:bg-gray-800 rounded-xl p-8 shadow-lg hover:shadow-xl transition-all hover:-translate-y-1 animate-fade-in-up"
          style="animation-delay: 50ms">
          <div class="flex flex-col md:flex-row gap-8">
            <div class="md:w-1/3 h-48 bg-gray-200 dark:bg-gray-700 rounded-lg flex items-center justify-center text-gray-400 dark:text-gray-500">
              <span class="text-5xl">🛠️</span>
            </div>
            <div class="md:w-2/3">
              <h3 class="text-2xl font-bold mb-4 text-gray-900 dark:text-white">{{ translations.product0Title[currentLanguage] }}</h3>
              <p class="text-lg mb-4">{{ translations.product0Desc[currentLanguage] }}</p>
              <ul class="mb-4 space-y-2">
                <li v-for="(feature, idx) in translations.product0Features[currentLanguage]" :key="'p0f'+idx"
                    class="flex items-start">
                  <svg class="flex-shrink-0 w-5 h-5 mt-0.5 mr-2 text-indigo-600 dark:text-indigo-400" fill="currentColor" viewBox="0 0 20 20">
                    <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414L9 14.414 5.293 10.707a1 1 0 011.414-1.414L9 11.586l6.293-6.293a1 1 0 011.414 0z" clip-rule="evenodd"></path>
                  </svg>
                  {{ feature }}
                </li>
              </ul>
              <p class="italic text-indigo-600 dark:text-indigo-400">{{ translations.product0IdealFor[currentLanguage] }}</p>
            </div>
          </div>
        </router-link>

        <!-- Product 1 -->
        <router-link to="/case-binance-tsl"
          class="bg-white dark:bg-gray-800 rounded-xl p-8 shadow-lg hover:shadow-xl transition-all hover:-translate-y-1 animate-fade-in-up"
          style="animation-delay: 150ms">
          <div class="flex flex-col md:flex-row gap-8">
            <div class="md:w-1/3 h-48 bg-gray-200 dark:bg-gray-700 rounded-lg flex items-center justify-center text-gray-400 dark:text-gray-500">
              <span class="text-5xl">🤖</span>
            </div>
            <div class="md:w-2/3">
              <h3 class="text-2xl font-bold mb-4 text-gray-900 dark:text-white">{{ translations.product1Title[currentLanguage] }}</h3>
              <p class="text-lg mb-4">{{ translations.product1Desc[currentLanguage] }}</p>
              <ul class="mb-4 space-y-2">
                <li v-for="(feature, idx) in translations.product1Features[currentLanguage]" :key="'p1f'+idx" 
                    class="flex items-start">
                  <svg class="flex-shrink-0 w-5 h-5 mt-0.5 mr-2 text-indigo-600 dark:text-indigo-400" fill="currentColor" viewBox="0 0 20 20">
                    <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414L9 14.414 5.293 10.707a1 1 0 011.414-1.414L9 11.586l6.293-6.293a1 1 0 011.414 0z" clip-rule="evenodd"></path>
                  </svg>
                  {{ feature }}
                </li>
              </ul>
              <p class="italic text-indigo-600 dark:text-indigo-400">{{ translations.product1IdealFor[currentLanguage] }}</p>
            </div>
          </div>
        </router-link>

        <!-- Product 2 -->
        <router-link to="/smart-home"
          class="bg-white dark:bg-gray-800 rounded-xl p-8 shadow-lg hover:shadow-xl transition-all hover:-translate-y-1 animate-fade-in-up"
          style="animation-delay: 250ms">
          <div class="flex flex-col md:flex-row gap-8">
            <div class="md:w-1/3 h-48 bg-gray-200 dark:bg-gray-700 rounded-lg flex items-center justify-center text-gray-400 dark:text-gray-500">
              <span class="text-5xl">🏠</span>
            </div>
            <div class="md:w-2/3">
              <h3 class="text-2xl font-bold mb-4 text-gray-900 dark:text-white">{{ translations.product2Title[currentLanguage] }}</h3>
              <p class="text-lg mb-4">{{ translations.product2Desc[currentLanguage] }}</p>
              <ul class="mb-4 space-y-2">
                <li v-for="(feature, idx) in translations.product2Features[currentLanguage]" :key="'p2f'+idx" 
                    class="flex items-start">
                  <svg class="flex-shrink-0 w-5 h-5 mt-0.5 mr-2 text-indigo-600 dark:text-indigo-400" fill="currentColor" viewBox="0 0 20 20">
                    <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414L9 14.414 5.293 10.707a1 1 0 011.414-1.414L9 11.586l6.293-6.293a1 1 0 011.414 0z" clip-rule="evenodd"></path>
                  </svg>
                  {{ feature }}
                </li>
              </ul>
              <p class="italic text-indigo-600 dark:text-indigo-400">{{ translations.product2Call[currentLanguage] }}</p>
            </div>
          </div>
        </router-link>

        <!-- Product 3 -->
        <router-link to="/event-soft"
          class="bg-white dark:bg-gray-800 rounded-xl p-8 shadow-lg hover:shadow-xl transition-all hover:-translate-y-1 animate-fade-in-up"
          style="animation-delay: 350ms">
          <div class="flex flex-col md:flex-row gap-8">
            <div class="md:w-1/3 h-48 bg-gray-200 dark:bg-gray-700 rounded-lg flex items-center justify-center text-gray-400 dark:text-gray-500">
              <span class="text-5xl">🎤</span>
            </div>
            <div class="md:w-2/3">
              <h3 class="text-2xl font-bold mb-4 text-gray-900 dark:text-white">{{ translations.product3Title[currentLanguage] }}</h3>
              <p class="text-lg mb-4">{{ translations.product3Desc[currentLanguage] }}</p>
              <ul class="mb-4 space-y-2">
                <li v-for="(feature, idx) in translations.product3Features[currentLanguage]" :key="'p3f'+idx" 
                    class="flex items-start">
                  <svg class="flex-shrink-0 w-5 h-5 mt-0.5 mr-2 text-indigo-600 dark:text-indigo-400" fill="currentColor" viewBox="0 0 20 20">
                    <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414L9 14.414 5.293 10.707a1 1 0 011.414-1.414L9 11.586l6.293-6.293a1 1 0 011.414 0z" clip-rule="evenodd"></path>
                  </svg>
                  {{ feature }}
                </li>
              </ul>
              <p class="italic text-indigo-600 dark:text-indigo-400">{{ translations.product3Call[currentLanguage] }}</p>
            </div>
          </div>
        </router-link>
      </div>
    </section>

    <!-- Open Source Philosophy Section -->
    <section class="mb-16 bg-white dark:bg-gray-800 rounded-xl p-8 shadow-lg">
      <div class="max-w-3xl mx-auto">
        <h2 class="text-2xl font-semibold mb-4 text-indigo-600 dark:text-indigo-400">
          {{ translations.openSourceTitle[currentLanguage] }}
        </h2>
        <p class="text-lg mb-4">
          {{ translations.openSourceText1[currentLanguage] }}
        </p>
        <p class="text-lg mb-6">
          {{ translations.openSourceText2[currentLanguage] }}
        </p>
        <div class="flex justify-center">
          <a href="https://github.com/your-repo" target="_blank" 
             class="inline-flex items-center px-6 py-3 bg-gray-900 text-white rounded-lg hover:bg-gray-700 transition-colors">
            <svg class="w-5 h-5 mr-2" fill="currentColor" viewBox="0 0 24 24" aria-hidden="true">
              <path fill-rule="evenodd" d="M12 2C6.477 2 2 6.484 2 12.017c0 4.425 2.865 8.18 6.839 9.504.5.092.682-.217.682-.483 0-.237-.008-.868-.013-1.703-2.782.605-3.369-1.343-3.369-1.343-.454-1.158-1.11-1.466-1.11-1.466-.908-.62.069-.608.069-.608 1.003.07 1.531 1.032 1.531 1.032.892 1.53 2.341 1.088 2.91.832.092-.647.35-1.088.636-1.338-2.22-.253-4.555-1.113-4.555-4.951 0-1.093.39-1.988 1.029-2.688-.103-.253-.446-1.272.098-2.65 0 0 .84-.27 2.75 1.026A9.564 9.564 0 0112 6.844c.85.004 1.705.115 2.504.337 1.909-1.296 2.747-1.027 2.747-1.027.546 1.379.202 2.398.1 2.651.64.7 1.028 1.595 1.028 2.688 0 3.848-2.339 4.695-4.566 4.943.359.309.678.92.678 1.855 0 1.338-.012 2.419-.012 2.747 0 .268.18.58.688.482A10.019 10.019 0 0022 12.017C22 6.484 17.522 2 12 2z" clip-rule="evenodd"></path>
            </svg>
            {{ translations.viewCode[currentLanguage] }}
          </a>
        </div>
      </div>
    </section>

    <!-- Why Choose Us Section -->
    <section class="mb-16 bg-gradient-to-r from-indigo-50 to-blue-50 dark:from-gray-800 dark:to-gray-700 rounded-xl p-8 shadow-lg">
      <h2 class="text-2xl font-semibold mb-6 text-center text-gray-900 dark:text-white">
        {{ translations.whyChooseUsTitle[currentLanguage] }}
      </h2>
      <div class="grid md:grid-cols-3 gap-6">
        <div v-for="(point, idx) in translations.whyChooseUsPoints[currentLanguage]" :key="'why'+idx"
             class="bg-white dark:bg-gray-800 p-6 rounded-lg shadow-sm hover:shadow-md transition-shadow">
          <div class="w-12 h-12 mb-4 rounded-full bg-indigo-100 dark:bg-indigo-900 flex items-center justify-center text-indigo-600 dark:text-indigo-300">
            <span class="text-xl">{{ ['💎', '🛠️', '🛡️'][idx] }}</span>
          </div>
          <p class="text-gray-700 dark:text-gray-300">{{ point }}</p>
        </div>
      </div>
    </section>

    <!-- CTA Section -->
    <section class="text-center bg-white dark:bg-gray-800 rounded-xl p-8 shadow-lg">
      <h2 class="text-2xl font-semibold mb-2 text-gray-900 dark:text-white">
        {{ translations.contactCall[currentLanguage] }}
      </h2>
      <p class="text-lg mb-6 text-gray-600 dark:text-gray-300 max-w-2xl mx-auto">
        {{ translations.contactPrompt[currentLanguage] }}
      </p>
      <button 
        @click="openModal"
        class="inline-flex items-center px-6 py-3 bg-indigo-600 text-white rounded-lg hover:bg-indigo-700 focus:ring-4 focus:ring-indigo-300 dark:focus:ring-indigo-900 transition-colors animate-pulse">
        {{ translations.cta[currentLanguage] }}
        <svg class="w-5 h-5 ml-2 -mr-1" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
          <path fill-rule="evenodd" d="M10.293 15.707a1 1 0 010-1.414L13.586 11H4a1 1 0 110-2h9.586l-3.293-3.293a1 1 0 111.414-1.414l5 5a1 1 0 010 1.414l-5 5a1 1 0 01-1.414 0z" clip-rule="evenodd"></path>
        </svg>
      </button>
    </section>

    <!-- Modal -->
    <transition name="modal-fade">
      <div v-if="formModal" @click.self="closeModal"
        class="fixed inset-0 flex items-center justify-center z-50 bg-black bg-opacity-70 p-4 backdrop-blur-sm">
        <div class="bg-white dark:bg-gray-800 rounded-xl shadow-xl w-full max-w-md transform transition-all duration-300 ease-out"
             :class="formModal ? 'animate-fade-in-up' : ''">
          <div class="p-8">
            <div class="flex justify-between items-center mb-6">
              <h3 class="text-2xl font-semibold text-gray-900 dark:text-white">
                {{ translations.formTitle[currentLanguage] }}
              </h3>
              <button @click="closeModal" aria-label="Close" class="text-gray-400 hover:text-gray-600 dark:hover:text-gray-200 transition-colors">
                <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path>
                </svg>
              </button>
            </div>
            
            <p class="text-gray-600 dark:text-gray-400 mb-6">
              {{ currentLanguage === 'ru' 
                ? 'Оставьте свои контактные данные и описание задачи, и мы свяжемся с вами для консультации.' 
                : 'Leave your contact details and task description, and we will contact you for consultation.' }}
            </p>
            
            <form class="space-y-6" @submit.prevent="submitForm">
              <div>
                <label for="modal-name" class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">
                  {{ translations.nameLabel[currentLanguage] }}
                </label>
                <input type="text" id="modal-name" v-model="formData.name" 
                  :placeholder="translations.namePlaceholder[currentLanguage]"
                  class="w-full px-4 py-3 border border-gray-300 rounded-lg shadow-sm focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-transparent dark:bg-gray-700 dark:border-gray-600 dark:text-white dark:placeholder-gray-400 transition-colors">
              </div>
              
              <div>
                <label for="modal-contact" class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">
                  {{ translations.contactLabel[currentLanguage] }} <span class="text-red-500">*</span>
                </label>
                <input type="text" id="modal-contact" v-model="formData.contact" required
                  :placeholder="translations.contactPlaceholder[currentLanguage]"
                  class="w-full px-4 py-3 border border-gray-300 rounded-lg shadow-sm focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-transparent dark:bg-gray-700 dark:border-gray-600 dark:text-white dark:placeholder-gray-400 transition-colors">
              </div>
              
              <div>
                <label for="modal-description" class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-2">
                  {{ translations.descriptionLabel[currentLanguage] }} <span class="text-red-500">*</span>
                </label>
                <textarea id="modal-description" v-model="formData.description" required rows="4"
                  :placeholder="translations.descriptionPlaceholder[currentLanguage]"
                  class="w-full px-4 py-3 border border-gray-300 rounded-lg shadow-sm focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:border-transparent dark:bg-gray-700 dark:border-gray-600 dark:text-white dark:placeholder-gray-400 resize-y transition-colors"></textarea>
              </div>
              
              <div class="h-6 text-sm text-center">
                <p v-if="formStatus.loading" class="text-indigo-600 dark:text-indigo-400 animate-pulse">
                  {{ translations.sending[currentLanguage] }}
                </p>
                <p v-if="formStatus.error" class="text-red-600 dark:text-red-400">{{ formStatus.error }}</p>
                <p v-if="formStatus.success" class="text-green-600 dark:text-green-400">{{ formStatus.success }}</p>
              </div>
              
              <button type="submit" :disabled="formStatus.loading || formStatus.success"
                class="w-full bg-indigo-600 text-white rounded-lg px-6 py-3 font-semibold hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500 disabled:opacity-50 disabled:cursor-not-allowed transition-colors duration-200">
                {{ formStatus.loading 
                  ? translations.sending[currentLanguage] 
                  : (formStatus.success 
                    ? translations.sent[currentLanguage] 
                    : translations.submit[currentLanguage]) }}
              </button>
            </form>
          </div>
        </div>
      </div>
    </transition>
  </div>
</template>

<script>
import { ref, reactive } from 'vue';
import { currentLanguage } from '../stores/language';

export default {
  name: 'ProductsPage',
  setup() {
    const translations = {
      title: {
        ru: 'Инновационные ИТ-решения для бизнеса и жизни',
        en: 'Innovative IT Solutions for Business and Life',
      },
      subtitle: {
        ru: 'Создаём передовое ПО для автоматизации автосервисов, торговли, умного дома и организации мероприятий. Мы создаем технологии, которые делают жизнь проще, а бизнес – эффективнее.',
        en: 'Develop advanced software for trade automation, smart homes, and event management. We create technologies that make life easier and business more efficient.',
      },
      productsTitle: {
        ru: 'Наши продукты',
        en: 'Our Products',
      },
      product0Title: {
        ru: 'Самурай - Революционная Система Управления Автосервисом',
        en: 'Samurai - Revolutionary Auto Service Management System',
      },
      product0Desc: {
        ru: 'Комплексная цифровая платформа для автосервисов с использованием headless CMS Strapi, Vue.js и Node-RED. Интеллектуальное создание заказ-нарядов с YandexGPT.',
        en: 'Comprehensive digital platform for auto services using headless CMS Strapi, Vue.js and Node-RED. Intelligent order creation with YandexGPT.',
      },
      product0Features: {
        ru: [
          'Интеллектуальное создание заказ-нарядов с ИИ YandexGPT',
          'Максимальная эффективность и автоматизация процессов',
          'Финансовая прозрачность и аналитика',
          'Полный контроль над клиентами',
          'Техническое превосходство с современным стеком',
        ],
        en: [
          'Intelligent order creation with YandexGPT AI',
          'Maximum efficiency and process automation',
          'Financial transparency and analytics',
          'Full customer control',
          'Technical superiority with modern stack',
        ],
      },
      product0IdealFor: {
        ru: 'Идеально для автосервисов, желающих вывести бизнес на новый уровень с помощью передовых технологий',
        en: 'Ideal for auto services looking to take their business to the next level with advanced technologies',
      },
      product1Title: {
        ru: 'TSL Bot – Автоматизированная торговля с Trailing Stop Loss',
        en: 'TSL Bot – Automated Trading with Trailing Stop Loss',
      },
      product1Desc: {
        ru: 'TSL Bot – это мощная система для автоматического управления стоп-лоссом с поддержкой множества инструментов.',
        en: 'TSL Bot is a powerful system for automatic stop-loss management supporting multiple instruments.',
      },
      product1Features: {
        ru: [
          'Trailing Stop Loss – динамичное сопровождение сделок для максимизации прибыли',
          'Асинхронная архитектура – высокая производительность и надежность',
          'Горизонтальное масштабирование – легко адаптируется под любые объемы торгов',
          'Мультиинструментность – одновременная работа с разными активами',
        ],
        en: [
          'Trailing Stop Loss – dynamic trade tracking to maximize profits',
          'Asynchronous architecture – high performance and reliability',
          'Horizontal scaling – easily adapts to any trading volume',
          'Multi-instrument support – simultaneous operation with different assets',
        ],
      },
      product1IdealFor: {
        ru: 'Идеально для трейдеров и инвестиционных фондов, ценящих скорость и точность',
        en: 'Ideal for traders and investment funds valuing speed and precision',
      },
      product2Title: {
        ru: 'Умный дом на базе WirenBoard',
        en: 'Smart Home based on WirenBoard',
      },
      product2Desc: {
        ru: 'Современное решение для автоматизации жилых и коммерческих помещений',
        en: 'A modern solution for automating residential and commercial premises',
      },
      product2Features: {
        ru: [
          'Полный контроль – управление светом, отоплением, безопасностью и мультимедиа',
          'Удобство – интеграция с мобильными приложениями и голосовыми помощниками',
          'Энергоэффективность – умные сценарии для экономии ресурсов',
        ],
        en: [
          'Full control – manage lighting, heating, security, and multimedia',
          'Convenience – integration with mobile apps and voice assistants',
          'Energy efficiency – smart scenarios for resource saving',
        ],
      },
      product2Call: {
        ru: 'Превратите свой дом в технологичный и безопасный комфорт-пространство',
        en: 'Turn your home into a technological and safe comfort space',
      },
      product3Title: {
        ru: 'Концертный софт – организация мероприятий нового уровня',
        en: 'Concert Software – Next-level Event Management',
      },
      product3Desc: {
        ru: 'Комплексная система для проведения концертов, фестивалей и корпоративных событий',
        en: 'A comprehensive system for concerts, festivals, and corporate events',
      },
      product3Features: {
        ru: [
          'Три кабинета – для зрителей, артистов и организаторов',
          'Интеграция с VK – авторизация и автоматическая галерея фото с тегами',
          'Трансляция текущего трека – название песни, текст, лайки в реальном времени',
          'Рейтинг артистов – автоматический подсчет лайков и формирование таблицы результатов',
        ],
        en: [
          'Three dashboards – for viewers, artists, and organizers',
          'VK integration – authorization and automatic photo gallery with tags',
          'Current track broadcast – song title, lyrics, likes in real time',
          'Artist rating – automatic like counting and leaderboard generation',
        ],
      },
      product3Call: {
        ru: 'Создавайте незабываемые события с нашим цифровым помощником',
        en: 'Create unforgettable events with our digital assistant',
      },
      openSourceTitle: {
        ru: 'Open Source философия',
        en: 'Open Source Philosophy',
      },
      openSourceText1: {
        ru: 'Весь наш код публикуется по принципам Open Source — это значит, что он абсолютно открыт и доступен для бесплатного использования. Мы верим, что открытость способствует развитию технологий и сообщества.',
        en: 'All our code is published under Open Source principles — this means it\'s completely open and available for free use. We believe that openness promotes technological and community development.',
      },
      openSourceText2: {
        ru: 'При этом мы предлагаем платные услуги по кастомизации кода под ваши нужды, профессиональному развертыванию решений и их дальнейшей поддержке. Так мы можем уделять максимум внимания каждому проекту.',
        en: 'At the same time, we offer paid services for code customization to your needs, professional solution deployment and further support. This allows us to give maximum attention to each project.',
      },
      viewCode: {
        ru: 'Смотреть код на GitHub',
        en: 'View code on GitHub',
      },
      whyChooseUsTitle: {
        ru: 'Почему выбирают нас?',
        en: 'Why Choose Us?',
      },
      whyChooseUsPoints: {
        ru: [
          'Опыт и экспертиза – работаем с передовыми технологиями',
          'Гибкость решений – адаптируем продукты под ваши задачи',
          'Надежность – стабильная работа даже при высоких нагрузках',
        ],
        en: [
          'Experience and expertise – working with cutting-edge technologies',
          'Solution flexibility – adapting products to your needs',
          'Reliability – stable operation even under high loads',
        ],
      },
      contactCall: {
        ru: 'Технологии будущего уже сегодня!',
        en: 'The technology of the future today!',
      },
      contactPrompt: {
        ru: 'Свяжитесь с нами – обсудим ваш проект и предложим лучшее решение',
        en: 'Contact us – let\'s discuss your project and offer the best solution',
      },
      cta: {
        ru: 'Оставить заявку',
        en: 'Request a consultation',
      },
      formTitle: {
        ru: 'Заявка на консультацию',
        en: 'Consultation Request'
      },
      nameLabel: {
        ru: 'Ваше имя',
        en: 'Your Name'
      },
      namePlaceholder: {
        ru: 'Как к вам обращаться? (необязательно)',
        en: 'How should we address you? (optional)'
      },
      contactLabel: {
        ru: 'Контактные данные',
        en: 'Contact Details'
      },
      contactPlaceholder: {
        ru: 'Телефон или email (обязательно)',
        en: 'Phone or email (required)'
      },
      descriptionLabel: {
        ru: 'Опишите вашу задачу',
        en: 'Describe your task'
      },
      descriptionPlaceholder: {
        ru: 'Расскажите, что вы хотите автоматизировать',
        en: 'Tell us what you want to automate'
      },
      sending: {
        ru: 'Отправка...',
        en: 'Sending...'
      },
      sent: {
        ru: 'Отправлено!',
        en: 'Sent!'
      },
      submit: {
        ru: 'Отправить заявку',
        en: 'Submit Request'
      },
      errorRequired: {
        ru: 'Пожалуйста, укажите контактные данные и описание задачи',
        en: 'Please provide contact details and task description'
      },
      errorSend: {
        ru: 'Ошибка отправки. Попробуйте снова или свяжитесь с нами другим способом',
        en: 'Sending error. Please try again or contact us by other means'
      },
      errorNetwork: {
        ru: 'Сетевая ошибка. Проверьте подключение и попробуйте снова',
        en: 'Network error. Check your connection and try again'
      },
      successMessage: {
        ru: 'Спасибо! Мы свяжемся с Вами в ближайшее время',
        en: 'Thank you! We will contact you shortly'
      }
    };

    const formModal = ref(false);
    const formData = reactive({
      name: '',
      contact: '',
      description: ''
    });
    const formStatus = reactive({
      loading: false,
      error: null,
      success: null,
    });

    const openModal = () => {
      formData.name = '';
      formData.contact = '';
      formData.description = '';
      formStatus.loading = false;
      formStatus.error = null;
      formStatus.success = null;
      formModal.value = true;
    };

    const closeModal = () => {
      formModal.value = false;
    };

    const submitForm = async () => {
      formStatus.loading = true;
      formStatus.error = null;
      formStatus.success = null;

      if (!formData.contact || !formData.contact.trim() || !formData.description || !formData.description.trim()) {
        formStatus.error = translations.errorRequired[currentLanguage];
        formStatus.loading = false;
        return;
      }

      const params = new URLSearchParams({
        name: formData.name.trim(),
        tel: formData.contact.trim(),
        description: formData.description.trim()
      });

      try {
        const res = await fetch(
          `https://ti-robots.netlify.app/zayavka/?${params.toString()}`,
          {
            method: "GET",
            headers: { Accept: "application/json" },
          }
        );

        if (res.ok) {
          formStatus.success = translations.successMessage[currentLanguage];
          formData.name = '';
          formData.contact = '';
          formData.description = '';
          setTimeout(() => {
            if (formStatus.success) {
              closeModal();
            }
          }, 3000);
        } else {
          const errorText = await res.text();
          console.error("Form submission error:", res.status, errorText);
          formStatus.error = `${translations.errorSend[currentLanguage]} (${res.status})`;
        }
      } catch (error) {
        console.error("Network error during form submission:", error);
        formStatus.error = translations.errorNetwork[currentLanguage];
      } finally {
        formStatus.loading = false;
      }
    };

    return {
      currentLanguage,
      translations,
      formModal,
      formData,
      formStatus,
      openModal,
      closeModal,
      submitForm
    };
  }
}
</script>

<style>
.animate-fade-in-down {
  animation: fadeInDown 0.6s ease-out;
}

.animate-fade-in-up {
  animation: fadeInUp 0.6s ease-out;
}

@keyframes fadeInDown {
  from {
    opacity: 0;
    transform: translateY(-20px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

@keyframes fadeInUp {
  from {
    opacity: 0;
    transform: translateY(20px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

.modal-fade-enter-active,
.modal-fade-leave-active {
  transition: opacity 0.3s ease;
}
.modal-fade-enter-from,
.modal-fade-leave-to {
  opacity: 0;
}

.animate-pulse {
  animation: pulse 2s infinite;
}

@keyframes pulse {
  0% {
    transform: scale(1);
  }
  50% {
    transform: scale(1.05);
  }
  100% {
    transform: scale(1);
  }
}
</style>
