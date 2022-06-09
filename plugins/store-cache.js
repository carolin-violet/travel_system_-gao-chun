export default function(context) {
  window.addEventListener('beforeunload', () => {
    context.$cookies.set("storeCache", JSON.stringify(context.store.state))
  });
  let storeCache = context.$cookies.get("storeCache")
  if (storeCache) {
    context.store.replaceState(JSON.parse(storeCache));
  }
}

