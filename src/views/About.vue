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

    <!-- Mission Section -->
    <section class="mb-16 bg-white dark:bg-gray-800 rounded-xl p-8 shadow-lg transition-all hover:shadow-xl">
      <h2 class="text-2xl font-semibold mb-4 text-indigo-600 dark:text-indigo-400">
        {{ translations.missionTitle[currentLanguage] }}
      </h2>
      <p class="text-lg leading-relaxed">
        {{ translations.missionText[currentLanguage] }}
      </p>
    </section>

    <!-- Open Source Section -->
    <section class="mb-16 bg-gradient-to-r from-indigo-50 to-blue-50 dark:from-gray-800 dark:to-gray-700 rounded-xl p-8 shadow-lg animate-fade-in">
      <h2 class="text-2xl font-semibold mb-4 text-indigo-600 dark:text-indigo-400">
        {{ translations.openSourceTitle[currentLanguage] }}
      </h2>
      <p class="text-lg leading-relaxed mb-4">
        {{ translations.openSourceText1[currentLanguage] }}
      </p>
      <p class="text-lg leading-relaxed mb-6">
        {{ translations.openSourceText2[currentLanguage] }}
      </p>
      <div class="flex justify-center">
        <a href="#" class="px-6 py-3 bg-indigo-600 text-white rounded-lg hover:bg-indigo-700 transition-colors flex items-center gap-2">
          <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 24 24" aria-hidden="true">
            <path fill-rule="evenodd" d="M12 2C6.477 2 2 6.484 2 12.017c0 4.425 2.865 8.18 6.839 9.504.5.092.682-.217.682-.483 0-.237-.008-.868-.013-1.703-2.782.605-3.369-1.343-3.369-1.343-.454-1.158-1.11-1.466-1.11-1.466-.908-.62.069-.608.069-.608 1.003.07 1.531 1.032 1.531 1.032.892 1.53 2.341 1.088 2.91.832.092-.647.35-1.088.636-1.338-2.22-.253-4.555-1.113-4.555-4.951 0-1.093.39-1.988 1.029-2.688-.103-.253-.446-1.272.098-2.65 0 0 .84-.27 2.75 1.026A9.564 9.564 0 0112 6.844c.85.004 1.705.115 2.504.337 1.909-1.296 2.747-1.027 2.747-1.027.546 1.379.202 2.398.1 2.651.64.7 1.028 1.595 1.028 2.688 0 3.848-2.339 4.695-4.566 4.943.359.309.678.92.678 1.855 0 1.338-.012 2.419-.012 2.747 0 .268.18.58.688.482A10.019 10.019 0 0022 12.017C22 6.484 17.522 2 12 2z" clip-rule="evenodd"></path>
          </svg>
          {{ translations.viewCode[currentLanguage] }}
        </a>
      </div>
    </section>

    <!-- Values Section -->
    <section class="mb-16">
      <h2 class="text-2xl font-semibold mb-8 text-center text-gray-900 dark:text-white">
        {{ translations.valuesTitle[currentLanguage] }}
      </h2>
      <div class="grid md:grid-cols-2 lg:grid-cols-4 gap-6">
        <div v-for="(value, index) in values" :key="index" 
             class="bg-white dark:bg-gray-800 p-6 rounded-xl shadow-md hover:shadow-lg transition-shadow hover:-translate-y-1 animate-fade-in-up"
             :style="`animation-delay: ${index * 100}ms`">
          <div class="w-12 h-12 mb-4 rounded-full bg-indigo-100 dark:bg-indigo-900 flex items-center justify-center text-indigo-600 dark:text-indigo-300">
            <span class="text-2xl">{{ value.emoji }}</span>
          </div>
          <h3 class="text-xl font-semibold mb-2 text-gray-900 dark:text-white">{{ value.title[currentLanguage] }}</h3>
          <p class="text-gray-600 dark:text-gray-300">{{ value.text[currentLanguage] }}</p>
        </div>
      </div>
    </section>

    <!-- Team Section -->
    <section class="mb-16">
      <h2 class="text-2xl font-semibold mb-8 text-center text-gray-900 dark:text-white">
        {{ translations.teamTitle[currentLanguage] }}
      </h2>
      <div class="grid md:grid-cols-2 lg:grid-cols-3 gap-8">
        <div v-for="(member, index) in team" :key="index" 
             class="bg-white dark:bg-gray-800 rounded-xl overflow-hidden shadow-md hover:shadow-xl transition-all text-center">
          <div class="p-6">
            <div class="w-32 h-32 mx-auto mb-4 rounded-full bg-gray-200 dark:bg-gray-700 flex items-center justify-center">
              <span class="text-5xl">{{ member.emoji }}</span>
            </div>
            <h3 class="text-xl font-bold text-gray-900 dark:text-white">{{ member.name }}</h3>
            <p class="text-indigo-600 dark:text-indigo-400 mb-2">{{ member.position[currentLanguage] }}</p>
            <p class="text-gray-600 dark:text-gray-300">{{ member.shortBio[currentLanguage] }}</p>
          </div>
        </div>
      </div>
    </section>

    <!-- Philosophy Section -->
    <section class="bg-white dark:bg-gray-800 rounded-xl p-8 shadow-lg">
      <h2 class="text-2xl font-semibold mb-4 text-indigo-600 dark:text-indigo-400">
        {{ translations.philosophyTitle[currentLanguage] }}
      </h2>
      <p class="italic text-lg leading-relaxed mb-4 border-l-4 border-indigo-500 pl-4">
        {{ translations.philosophyQuote[currentLanguage] }}
      </p>
      <p class="text-lg leading-relaxed">
        {{ translations.philosophyText[currentLanguage] }}
      </p>
    </section>
  </div>
</template>

<script>
import { currentLanguage } from '../stores/language';

export default {
  name: 'About',
  setup() {
    const translations = {
      title: {
        ru: 'О компании',
        en: 'About Us',
      },
      subtitle: {
        ru: 'Создаем технологии, которые делают жизнь проще и интереснее',
        en: 'Creating technologies that make life easier and more interesting',
      },
      missionTitle: {
        ru: 'Наша миссия',
        en: 'Our Mission',
      },
      missionText: {
        ru: 'Мы — гики, которые любят музыку и технологии. Поэтому создали систему для концертов (и не только), чтобы организаторы меньше страдали, а зрители — больше радовались. А заодно автоматизировали свои дома и пишем торговых роботов — потому что можем.',
        en: 'We are geeks who love music and technology. That\'s why we created a system for concerts (and more) to make organizers suffer less and audiences enjoy more. At the same time, we automated our homes and write trading bots — simply because we can.',
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
        ru: 'Посмотреть код',
        en: 'View Code',
      },
      valuesTitle: {
        ru: 'Наши ценности',
        en: 'Our Values',
      },
      teamTitle: {
        ru: 'Наша команда',
        en: 'Our Team',
      },
      philosophyTitle: {
        ru: 'Философия',
        en: 'Philosophy',
      },
      philosophyQuote: {
        ru: '«Главное — чтобы работало, кайфовалось и не раздражало»',
        en: '"The main thing is that it works, feels good, and doesn\'t annoy."',
      },
      philosophyText: {
        ru: '(Короче, мы те самые ребята, которые на концерте кайфуют от музыки, но при этом не могут удержаться, чтобы не оптимизировать раздачу билетов или освещение в зале. Ну и дома у нас всё «умное», конечно. А торгового бота написали просто потому, что было интересно). 🚀',
        en: '(In short, we are those guys who enjoy music at concerts but can\'t resist optimizing ticket distribution or lighting in the hall. And of course, our homes are all "smart". We wrote a trading bot simply because it was interesting). 🚀',
      },
    };

    const values = [
      {
        emoji: '🎵',
        title: {
          ru: 'Код + музыка',
          en: 'Code + Music'
        },
        text: {
          ru: 'Наш софт для мероприятий родился из любви к live-выступлениям. Он для тех, кто хочет провести концерт, фестиваль или лекцию без лишней головной боли.',
          en: 'Our event software was born from a love of live performances. It\'s for those who want to hold a concert, festival, or lecture without unnecessary headaches.'
        }
      },
      {
        emoji: '⚡',
        title: {
          ru: 'Автоматизируем всё',
          en: 'Automate Everything'
        },
        text: {
          ru: 'Если можно не делать вручную — мы напишем скрипт. Умный дом? Алготрейдинг? Да просто ради интереса.',
          en: 'If it can be done automatically — we\'ll write a script. Smart home? Algo trading? Just for fun.'
        }
      },
      {
        emoji: '🧘',
        title: {
          ru: 'Без фанатизма',
          en: 'No Fanaticism'
        },
        text: {
          ru: 'Технологии должны помогать, а не усложнять. Пишем только то, что реально работает.',
          en: 'Technology should help, not complicate. We write only what really works.'
        }
      },
      {
        emoji: '❤️',
        title: {
          ru: 'Как для себя',
          en: 'Like for Ourselves'
        },
        text: {
          ru: 'Делаем так, чтобы самим было удобно. Если нравится нам — понравится и другим.',
          en: 'We do it so it\'s convenient for ourselves. If we like it — others will too.'
        }
      }
    ];

    const team = [
      {
        name: 'Александр Рудин',
        emoji: '👔',
        position: {
          ru: 'Генеральный директор',
          en: 'CEO'
        },
        shortBio: {
          ru: 'Стратег и визионер компании',
          en: 'Company strategist and visionary'
        }
      },
      {
        name: 'Светлана Лось',
        emoji: '💰',
        position: {
          ru: 'Финансовый директор',
          en: 'CFO'
        },
        shortBio: {
          ru: 'Контролирует финансы компании',
          en: 'Controls company finances'
        }
      },
      {
        name: 'Василий Прохожев',
        emoji: '👨‍💻',
        position: {
          ru: 'Главный программист',
          en: 'Lead Developer'
        },
        shortBio: {
          ru: 'Отвечает за техническую реализацию',
          en: 'Responsible for technical implementation'
        }
      },
      {
        name: 'Александр Новиков',
        emoji: '📢',
        position: {
          ru: 'Маркетинг-директор',
          en: 'Marketing Director'
        },
        shortBio: {
          ru: 'Управляет маркетинговыми стратегиями',
          en: 'Manages marketing strategies'
        }
      },
      {
        name: 'Владимир Пастов',
        emoji: '🤝',
        position: {
          ru: 'Директор по связям с общественностью',
          en: 'PR Director'
        },
        shortBio: {
          ru: 'Формирует имидж компании',
          en: 'Shapes company image'
        }
      },
      {
        name: 'Евгений Бобков',
        emoji: '📈',
        position: {
          ru: 'Руководитель отдела продаж',
          en: 'Sales Manager'
        },
        shortBio: {
          ru: 'Развивает коммерческие направления',
          en: 'Develops commercial areas'
        }
      }
    ];

    return {
      currentLanguage,
      translations,
      values,
      team
    };
  },
};
</script>

<style>
.animate-fade-in-down {
  animation: fadeInDown 0.6s ease-out;
}

.animate-fade-in-up {
  animation: fadeInUp 0.6s ease-out;
}

.animate-fade-in {
  animation: fadeIn 0.6s ease-out;
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

@keyframes fadeIn {
  from {
    opacity: 0;
  }
  to {
    opacity: 1;
  }
}
</style>