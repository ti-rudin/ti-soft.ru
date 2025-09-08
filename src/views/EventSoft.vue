<template>
  <div class="max-w-6xl mx-auto p-6 bg-gray-50 dark:bg-gray-900 min-h-screen text-gray-700 dark:text-gray-300">
    <!-- Product Header -->
    <div class="mb-12 text-center">
      <div class="flex flex-wrap justify-center gap-2 mb-6">
        <span 
          v-for="(tag, index) in product.tags" 
          :key="index"
          class="px-3 py-1 rounded-full text-sm font-medium"
          :class="{
            'bg-purple-100 dark:bg-purple-900 text-purple-800 dark:text-purple-200': index === 0,
            'bg-gray-100 dark:bg-gray-700 text-gray-800 dark:text-gray-200': index !== 0
          }">
          {{ translations.tags[tag][currentLanguage] }}
        </span>
      </div>
      <h1 class="text-3xl md:text-4xl font-bold mb-4 text-gray-900 dark:text-white">
        {{ product.title[currentLanguage] }}
      </h1>
      <p class="text-xl text-gray-600 dark:text-gray-300 max-w-3xl mx-auto">
        {{ product.subtitle[currentLanguage] }}
      </p>
    </div>

    <!-- Product Image -->
    <div class="mb-12 h-96 bg-gray-200 dark:bg-gray-700 rounded-xl flex items-center justify-center">
      <span class="text-8xl">🎤</span>
    </div>

    <!-- Product Content -->
    <article class="prose dark:prose-invert max-w-3xl mx-auto mb-16">
      <h2>{{ translations.content.intro[currentLanguage] }}</h2>
      <p>{{ translations.content.introText[currentLanguage] }}</p>
      
      <h2>{{ translations.content.features[currentLanguage] }}</h2>
      <ul>
        <li v-for="(feature, index) in translations.content.featureList[currentLanguage]" :key="index">
          {{ feature }}
        </li>
      </ul>

      <h2>{{ translations.content.widget[currentLanguage] }}</h2>
      <p>{{ translations.content.widgetText[currentLanguage] }}</p>

      <div class="bg-purple-50 dark:bg-purple-900 p-6 rounded-xl border border-purple-200 dark:border-purple-800">
        <h3 class="text-purple-800 dark:text-purple-200 mt-0">{{ translations.content.tip[currentLanguage] }}</h3>
        <p class="text-purple-700 dark:text-purple-300 mb-0">{{ translations.content.tipText[currentLanguage] }}</p>
      </div>
    </article>

    <!-- Package Info -->
    <div class="max-w-3xl mx-auto mb-16 p-6 bg-white dark:bg-gray-800 rounded-xl shadow-sm">
      <h2 class="text-xl font-semibold mb-4 text-gray-900 dark:text-white">
        {{ translations.package.title[currentLanguage] }}
      </h2>
      <p class="mb-4">{{ translations.package.description[currentLanguage] }}</p>
      <ul class="space-y-2">
        <li v-for="(item, index) in translations.package.items[currentLanguage]" :key="index" class="flex items-start">
          <svg class="h-5 w-5 text-purple-500 mr-2 mt-0.5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7" />
          </svg>
          <span>{{ item }}</span>
        </li>
      </ul>
    </div>

    <!-- Use Cases -->
    <section class="mb-16">
      <h2 class="text-2xl font-semibold mb-8 text-center text-gray-900 dark:text-white">
        {{ translations.useCases.title[currentLanguage] }}
      </h2>
      <div class="grid md:grid-cols-3 gap-8">
        <div 
          v-for="(item, index) in useCases" 
          :key="index"
          class="bg-white dark:bg-gray-800 rounded-xl overflow-hidden shadow-md hover:shadow-lg transition-all hover:-translate-y-1">
          <div class="h-40 bg-gray-200 dark:bg-gray-700 flex items-center justify-center">
            <span class="text-4xl">{{ item.emoji }}</span>
          </div>
          <div class="p-6">
            <h3 class="text-lg font-bold mb-2 text-gray-900 dark:text-white">
              {{ item.title[currentLanguage] }}
            </h3>
            <p class="text-gray-600 dark:text-gray-300 text-sm">
              {{ item.description[currentLanguage] }}
            </p>
          </div>
        </div>
      </div>
    </section>

    <!-- Testimonials -->
    <section class="max-w-3xl mx-auto mb-16">
      <h2 class="text-2xl font-semibold mb-6 text-gray-900 dark:text-white">
        {{ translations.testimonials[currentLanguage] }}
      </h2>
      
      <div class="space-y-6">
        <!-- Testimonial 1 -->
        <div class="bg-white dark:bg-gray-800 p-6 rounded-lg shadow-sm">
          <div class="flex items-start mb-4">
            <div class="w-10 h-10 rounded-full bg-gray-300 dark:bg-gray-600 flex items-center justify-center mr-3">
              <span class="text-lg">👤</span>
            </div>
            <div>
              <h4 class="font-medium text-gray-900 dark:text-white">Иван Концертов</h4>
              <p class="text-xs text-gray-500 dark:text-gray-400">Организатор фестиваля "Лето Live"</p>
            </div>
          </div>
          <p class="text-gray-700 dark:text-gray-300">
            "Ti Events полностью изменил наш подход к организации мероприятий. Зрители в восторге от интерактивных возможностей, а нам как организаторам стало проще управлять программой."
          </p>
        </div>

        <!-- Testimonial 2 -->
        <div class="bg-white dark:bg-gray-800 p-6 rounded-lg shadow-sm">
          <div class="flex items-start mb-4">
            <div class="w-10 h-10 rounded-full bg-gray-300 dark:bg-gray-600 flex items-center justify-center mr-3">
              <span class="text-lg">👩</span>
            </div>
            <div>
              <h4 class="font-medium text-gray-900 dark:text-white">Анна Семинарова</h4>
              <p class="text-xs text-gray-500 dark:text-gray-400">Координатор бизнес-конференций</p>
            </div>
          </div>
          <p class="text-gray-700 dark:text-gray-300">
            "Использовали Ti Events для серии корпоративных семинаров. Виджет с расписанием докладчиков и возможностью задавать вопросы значительно повысил вовлечённость аудитории."
          </p>
        </div>
      </div>
    </section>

    <!-- Contact Form -->
    <section class="max-w-3xl mx-auto">
      <div class="bg-white dark:bg-gray-800 p-6 rounded-lg shadow-sm">
        <h3 class="text-lg font-medium mb-4 text-gray-900 dark:text-white">
          {{ translations.contact.title[currentLanguage] }}
        </h3>
        <p class="mb-6">{{ translations.contact.description[currentLanguage] }}</p>
        <form class="space-y-4">
          <div>
            <label for="name" class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-1">
              {{ translations.form.name[currentLanguage] }}
            </label>
            <input type="text" id="name" 
              class="w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-purple-500 dark:bg-gray-700 dark:border-gray-600 dark:text-white">
          </div>
          <div>
            <label for="email" class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-1">
              {{ translations.form.email[currentLanguage] }}
            </label>
            <input type="email" id="email" 
              class="w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-purple-500 dark:bg-gray-700 dark:border-gray-600 dark:text-white">
          </div>
          <div>
            <label for="message" class="block text-sm font-medium text-gray-700 dark:text-gray-300 mb-1">
              {{ translations.form.message[currentLanguage] }}
            </label>
            <textarea id="message" rows="4"
              class="w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-purple-500 dark:bg-gray-700 dark:border-gray-600 dark:text-white resize-y"></textarea>
          </div>
          <button type="submit"
            class="px-4 py-2 bg-purple-600 text-white rounded-md hover:bg-purple-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-purple-500 transition-colors">
            {{ translations.form.submit[currentLanguage] }}
          </button>
        </form>
      </div>
    </section>
  </div>
</template>

<script>
import { ref } from 'vue';
import { currentLanguage } from '../stores/language';

export default {
  name: 'TiEventsPage',
  setup() {
    const translations = {
      tags: {
        events: {
          ru: 'Мероприятия',
          en: 'Events'
        },
        streaming: {
          ru: 'Стриминг',
          en: 'Streaming'
        },
        pwa: {
          ru: 'PWA',
          en: 'PWA'
        },
        interactive: {
          ru: 'Интерактив',
          en: 'Interactive'
        }
      },
      content: {
        intro: {
          ru: 'О продукте',
          en: 'About the Product'
        },
        introText: {
          ru: 'Веб-приложение «Ti Events» от разработчика «Титаниум Софт» предназначено для организаторов мероприятий любого масштаба - от музыкальных фестивалей до бизнес-конференций и онлайн-трансляций.',
          en: 'The "Ti Events" web application by "Titanium Soft" is designed for organizers of events of any scale - from music festivals to business conferences and online broadcasts.'
        },
        features: {
          ru: 'Основные возможности',
          en: 'Key Features'
        },
        featureList: {
          ru: [
            'Размещение на собственном домене',
            'Создание персональных страниц участников',
            'Проведение прямых эфиров мероприятий',
            'Интерактивное взаимодействие с аудиторией',
            'PWA-технология для быстрого доступа',
            'Кастомизация под конкретное мероприятие'
          ],
          en: [
            'Deployment on your own domain',
            'Creation of personal pages for participants',
            'Live streaming of events',
            'Interactive audience engagement',
            'PWA technology for quick access',
            'Customization for specific events'
          ]
        },
        widget: {
          ru: 'Интерактивный виджет',
          en: 'Interactive Widget'
        },
        widgetText: {
          ru: 'Наш виджет прямого эфира позволяет зрителям в реальном времени отслеживать программу мероприятия, получать информацию об участниках, взаимодействовать через эмодзи-реакции и участвовать в розыгрышах. Виджет можно кастомизировать под конкретные нужды вашего ивента.',
          en: 'Our live widget allows viewers to track the event program in real time, get information about participants, interact through emoji reactions and participate in giveaways. The widget can be customized to the specific needs of your event.'
        },
        tip: {
          ru: 'Решение "под ключ"',
          en: 'Turnkey Solution'
        },
        tipText: {
          ru: 'Мы предлагаем полную реализацию проекта вашего мероприятия, включая создание сайта, настройку функционала и техническую поддержку.',
          en: 'We offer a complete implementation of your event project, including website creation, functionality setup and technical support.'
        }
      },
      package: {
        title: {
          ru: 'Комплексное решение',
          en: 'Comprehensive Solution'
        },
        description: {
          ru: 'Наш пакет услуг включает всё необходимое для успешного проведения мероприятия:',
          en: 'Our service package includes everything you need for a successful event:'
        },
        items: {
          ru: [
            'Персональный сайт мероприятия на вашем домене',
            'Готовое к работе веб-приложение с виджетом',
            'Полная техническая поддержка (включая срочную)',
            'Автоматические обновления ПО',
            'Помощь в настройке и кастомизации'
          ],
          en: [
            'Personal event website on your domain',
            'Ready-to-use web application with widget',
            'Full technical support (including emergency)',
            'Automatic software updates',
            'Setup and customization assistance'
          ]
        }
      },
      useCases: {
        title: {
          ru: 'Сценарии использования',
          en: 'Use Cases'
        }
      },
      testimonials: {
        ru: 'Отзывы клиентов',
        en: 'Testimonials'
      },
      contact: {
        title: {
          ru: 'Заинтересованы?',
          en: 'Interested?'
        },
        description: {
          ru: 'Оставьте заявку, и мы свяжемся с вами для обсуждения деталей вашего мероприятия.',
          en: 'Leave a request and we will contact you to discuss the details of your event.'
        }
      },
      form: {
        name: {
          ru: 'Ваше имя',
          en: 'Your Name'
        },
        email: {
          ru: 'Электронная почта',
          en: 'Email'
        },
        message: {
          ru: 'О вашем мероприятии',
          en: 'About your event'
        },
        submit: {
          ru: 'Отправить заявку',
          en: 'Submit Request'
        }
      }
    };

    const product = ref({
      emoji: '🎤',
      tags: ['events', 'streaming', 'pwa', 'interactive'],
      title: {
        ru: 'Ti Events - платформа для организации мероприятий',
        en: 'Ti Events - Event Management Platform'
      },
      subtitle: {
        ru: 'Комплексное решение для проведения концертов, фестивалей, конференций и онлайн-трансляций',
        en: 'Comprehensive solution for concerts, festivals, conferences and online broadcasts'
      }
    });

    const useCases = ref([
      {
        emoji: '🎵',
        title: {
          ru: 'Музыкальные фестивали',
          en: 'Music Festivals'
        },
        description: {
          ru: 'Интерактивное расписание, информация об артистах, тексты песен и реакции зрителей',
          en: 'Interactive schedule, artist info, lyrics and audience reactions'
        }
      },
      {
        emoji: '📚',
        title: {
          ru: 'Конференции',
          en: 'Conferences'
        },
        description: {
          ru: 'Программа выступлений, профили спикеров, Q&A сессии и онлайн-голосования',
          en: 'Speaker schedule, profiles, Q&A sessions and online polls'
        }
      },
      {
        emoji: '🎭',
        title: {
          ru: 'Театральные постановки',
          en: 'Theater Performances'
        },
        description: {
          ru: 'Трансляции репетиций, информация об актерах и создателях, интерактивные программы',
          en: 'Rehearsal streams, actor and crew info, interactive programs'
        }
      }
    ]);

    return {
      currentLanguage,
      translations,
      product,
      useCases
    };
  }
}
</script>

<style>
.prose {
  color: inherit;
  max-width: 100%;
}

.prose h2 {
  color: inherit;
  margin-top: 2em;
  margin-bottom: 1em;
  font-size: 1.5em;
  font-weight: 600;
}

.prose p {
  margin-bottom: 1.5em;
  line-height: 1.6;
}

.prose ul {
  list-style-type: disc;
  padding-left: 1.5em;
  margin-bottom: 1.5em;
}

.prose li {
  margin-bottom: 0.5em;
}

.dark .prose {
  color: inherit;
}

.dark .prose h2 {
  color: inherit;
}
</style>