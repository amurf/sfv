<template>
  <div>
    <div class='header'>
      <h1 class="title">{{ characterName }}</h1>
      <img :src="characterHeaderImage" alt="" />
    </div>
    <b-tabs>
      <b-tab title="Basics">
        <b-card-group deck>
          <b-card header="Moves">
            <ul>
              <li v-for="(input, name) in characterData.moves">{{ name }}: {{ input }}</li>
            </ul>
          </b-card>
          <b-card header="Confirms">
            <ul>
              <li v-for="confirm in characterData.confirms">{{ confirm }}</li>
            </ul>
          </b-card>
        </b-card-group>
      </b-tab>
      <template v-for="state in characterData.state">
        <b-tab :title="state.description">
          <b-card v-for="combo in state.combos" :key="combo.description + combo.starter"
            :header="combo.starter + ' - ' + combo.description">
            <combo-list position="midscreen" :combos="combo.midscreen"></combo-list>
            <combo-list position="corner" :combos="combo.corner" v-if="combo.corner"></combo-list>
          </b-card>
        </b-tab>
      </template>
    </b-tabs>
  </div>
</template>

<script>

import characterData from '~/character_data.yaml';
import ComboList from '~/components/ComboList.vue';
import { groupBy } from 'lodash';

export default {
  components: { ComboList },
  validate ({ params }) {
    return (characterData[params.characterName]);
  },
  asyncData ({ params }) {
    return {
      characterData: characterData[params.characterName],
      characterName: params.characterName,
    };
  },
  computed: {
    characterHeaderImage() {
      return `/${this.characterName}.gif`;
    },
  },
}
</script>

<style>
li {
  list-style-type: none;
}

.title {
  font-family: "Quicksand", "Source Sans Pro", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif; /* 1 */
  display: block;
  font-weight: 300;
  font-size: 80px;
  color: #35495e;
  letter-spacing: 1px;
  text-transform: capitalize;
  text-align: center;
}

.header {
  text-align: center;
}

.header .title, .header img {
  display:inline-block;
}

.header img {
  vertical-align: unset;
  height: 100px;
}

.links {
  padding-top: 15px;
}

.meter, .damage-stun {
  margin: 0.1em;
}

.combo-list {
  text-align: left;
}
.card {
  margin-top: 1em;
}
.tab-content {
  padding: 1em;
}
</style>

