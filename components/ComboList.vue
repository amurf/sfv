<template>
  <ul class='combo-list'>
    <h6 class='card-subtitle mb-2 text-muted'>{{ position }}</h6>
    <li v-for="variation in combos" :key="variation.meter + '-' + position">
      {{ variation.combo }}
      <b-badge variant="primary" class='damage-stun'>{{ variation.damage }}/{{ variation.stun }}</b-badge>
      <b-badge variant="warning" class='meter'>{{ meterUsage(variation.meter) }}</b-badge>
    </li>
  </ul>
</template>
<script>

export default {
  props: ['combos', 'position'],
  methods: {
    meterUsage(meter) {
      return meter == 0 ? 'meterless' : `${meter} bar`;
    },
  }
}

</script>
<style>
</style>

