<template>
  <section class="container">
    <div>
      <h1 class="title">
        {{ characterName }}
      </h1>
      <template v-for="state in characterData.state">
        <h2>{{ state.description }}</h2>
        <template v-for="combo in state.combos">
          <h3>{{ combo.starter }} {{ combo.description }}</h3>
          <ul>
            <li v-for="variation in combo.variations">
              {{ variation.combo }} ({{ variation.damage }}/{{ variation.stun }}), {{ meterUsage(variation.meter) }}
            </li>
          </ul>
        </template>
      </template>
    </div>
  </section>
</template>

<script>

import characterData from '~/character_data.yaml';

export default {
  validate ({ params }) {
    return (characterData[params.characterName]);
  },
  asyncData ({ params }) {
    return {
      characterData: characterData[params.characterName],
      characterName: params.characterName,
    };
  },
  methods: {
    meterUsage(meter) {
      return meter == 0 ? 'meterless' : `${meter} bar`;
    },
  }
}
</script>

<style>
li {
  list-style-type: none;
}

.container {
  min-height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
  text-align: center;
}

.title {
  font-family: "Quicksand", "Source Sans Pro", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif; /* 1 */
  display: block;
  font-weight: 300;
  font-size: 100px;
  color: #35495e;
  letter-spacing: 1px;
  text-transform: capitalize;
}

.subtitle {
  font-weight: 300;
  font-size: 42px;
  color: #526488;
  word-spacing: 5px;
  padding-bottom: 15px;
}

.links {
  padding-top: 15px;
}
</style>

