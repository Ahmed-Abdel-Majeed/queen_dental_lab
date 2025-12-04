'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "e7bcaccbc5ed8852fdda0bb82db92dbc",
"assets/AssetManifest.bin.json": "57acfe091b1a835e1c03552e418271df",
"assets/AssetManifest.json": "51718e3ce659af76f41ef69831397beb",
"assets/assets/ChatGPT%2520Image%2520Oct%252031,%25202025,%252003_01_53%2520PM.png": "090d2fa613cbc2ef4250fc9a76b9dbc6",
"assets/assets/ChatGPT%2520Image%2520Oct%252031,%25202025,%252003_15_58%2520PM.png": "de764103df8942949ce8eb1b425ba28f",
"assets/assets/dark-removebg-preview.png": "ddb756ea7dd462ca5ef00b1d94aed1d9",
"assets/assets/dark.jpg": "61541804948033142649114bfe396fea",
"assets/assets/dark2.jpg": "76f75bbc4f48b634dfb49a2df7469dc5",
"assets/assets/dark2RB.png": "3379b24b91a2df90f328604934969e06",
"assets/assets/fonts/Cairo-Bold.ttf": "ad486798eb3ea4fda12b90464dd0cfcd",
"assets/assets/fonts/PlaywriteVNGuides-Regular.ttf": "b4fb50dcc89e6f090ad7531bbe7bd910",
"assets/assets/fonts/WorkSans-Italic-VariableFont_wght.ttf": "4ddd5c05fb85c67fe53ec0af3371c4d8",
"assets/assets/Frame%2520109.png": "55a582bf9863bfd111d0ff42281f4b60",
"assets/assets/Gemini_Generated_Image_cfsbvicfsbvicfsb.png": "2504675473df8fd3a7cb3dbbd3d9e03b",
"assets/assets/Gemini_Generated_Image_ojrvhmojrvhmojrv.png": "3d885da4ba22c5f871ec6ba0369b1763",
"assets/assets/image%252012.png": "6af4065acbb6b009c47000542e84c62e",
"assets/assets/image-1.png": "90b5fccc6f31c6b16eb26cb700ebe9e1",
"assets/assets/image.png": "4dd1d81b5db35118c4cec90d2caedcbf",
"assets/assets/light%2520bulb.png": "fe86a8dac882bd9682239d0a1827ea99",
"assets/assets/light.jpg": "eba79ab452272a39cfeca055ed716e9d",
"assets/assets/lightRB2.png": "b3ad231b043f69359c95bbc6437b1168",
"assets/assets/our_business/1.mp4": "afec6a8b42498e637a8a2a3027e9e2df",
"assets/assets/our_business/2.mp4": "f2d135d1efd1792e0db2bba06e20b87a",
"assets/assets/our_business/3.mp4": "5cfc880b37c19dd8de0562e4904dec08",
"assets/assets/our_business/WhatsApp%2520Image%25202025-12-04%2520at%252016.45.06_b0b598bd.jpg": "56882780ed4a99a6f7ca66b7b49964f1",
"assets/assets/our_business/WhatsApp%2520Image%25202025-12-04%2520at%252016.45.06_bbf091bd.jpg": "c12af5f04f71964be7e55cf4aa8449eb",
"assets/assets/our_business/WhatsApp%2520Image%25202025-12-04%2520at%252016.45.06_f7cacdc1.jpg": "c12af5f04f71964be7e55cf4aa8449eb",
"assets/assets/our_business/WhatsApp%2520Image%25202025-12-04%2520at%252016.45.47_8b96b9d5.jpg": "61cca3cce201d1d141eb12cf40232a23",
"assets/assets/our_business/WhatsApp%2520Image%25202025-12-04%2520at%252016.45.47_9236aa65.jpg": "30ace44c92573c3288d3465393fa5f67",
"assets/assets/our_business/WhatsApp%2520Image%25202025-12-04%2520at%252016.45.48_123378ac.jpg": "22e188c0417a3e5ee78a79697a868e6d",
"assets/assets/our_business/WhatsApp%2520Image%25202025-12-04%2520at%252016.45.51_8748d6d5.jpg": "2d6a446ab48c21690de863893d800b8f",
"assets/assets/our_business/WhatsApp%2520Image%25202025-12-04%2520at%252016.45.52_c2d4cbbd.jpg": "9af78702b9e934d6150e158ded1c8df7",
"assets/assets/our_business/WhatsApp%2520Image%25202025-12-04%2520at%252016.45.53_c0c7a116.jpg": "fb9e74208be2c0219dd578ade4d398cf",
"assets/assets/rating/1.jpg": "90733fe96059996460ee6dc59e1feb8c",
"assets/assets/rating/2.jpg": "9fdc34d7622bcf66ece483ae4ae21d3e",
"assets/assets/rating/3.jpg": "051e223ab2d9e3f66f8c9ad04c58f527",
"assets/assets/rating/4.jpg": "9243189d23f2b6ae6a39a05d05c65d2b",
"assets/assets/rating/5.jpg": "20f68c981c0d80c1ca7dfe82f0951fbf",
"assets/assets/rating/6.jpg": "8064ef9bd3877b4f599a18eca79264f7",
"assets/assets/rating/7.jpg": "82d29eb93aa0cce788e36315e5a9505b",
"assets/assets/rating/Gemini_Generated_Image_zgnp5lzgnp5lzgnp.png": "9168b1ed1314e7f15aaca3abf312ab78",
"assets/FontManifest.json": "23b06fa4f10a347dba5fec53ec73cc34",
"assets/fonts/MaterialIcons-Regular.otf": "800b9a7d980763a02e741ffbea9064ba",
"assets/NOTICES": "5e60fad734f63a2f7eb9852051a3ae1d",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/packages/flutter_arc_text/assets/README.md": "fbaed1ae60d80596d99545ef45d72803",
"assets/packages/font_awesome_flutter/lib/fonts/Font-Awesome-7-Brands-Regular-400.otf": "e694c1bb2d5a59b6a0f3f1d52b28cac5",
"assets/packages/font_awesome_flutter/lib/fonts/Font-Awesome-7-Free-Regular-400.otf": "b2703f18eee8303425a5342dba6958db",
"assets/packages/font_awesome_flutter/lib/fonts/Font-Awesome-7-Free-Solid-900.otf": "5b8d20acec3e57711717f61417c1be44",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "140ccb7d34d0a55065fbd422b843add6",
"canvaskit/canvaskit.js.symbols": "58832fbed59e00d2190aa295c4d70360",
"canvaskit/canvaskit.wasm": "07b9f5853202304d3b0749d9306573cc",
"canvaskit/chromium/canvaskit.js": "5e27aae346eee469027c80af0751d53d",
"canvaskit/chromium/canvaskit.js.symbols": "193deaca1a1424049326d4a91ad1d88d",
"canvaskit/chromium/canvaskit.wasm": "24c77e750a7fa6d474198905249ff506",
"canvaskit/skwasm.js": "1ef3ea3a0fec4569e5d531da25f34095",
"canvaskit/skwasm.js.symbols": "0088242d10d7e7d6d2649d1fe1bda7c1",
"canvaskit/skwasm.wasm": "264db41426307cfc7fa44b95a7772109",
"canvaskit/skwasm_heavy.js": "413f5b2b2d9345f37de148e2544f584f",
"canvaskit/skwasm_heavy.js.symbols": "3c01ec03b5de6d62c34e17014d1decd3",
"canvaskit/skwasm_heavy.wasm": "8034ad26ba2485dab2fd49bdd786837b",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "888483df48293866f9f41d3d9274a779",
"flutter_bootstrap.js": "726f8e65e4c0c5938e518f6b40026f4e",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "f2b74f15730780e6ab3a0e8cdd94b137",
"/": "f2b74f15730780e6ab3a0e8cdd94b137",
"main.dart.js": "411dd3f48fd43a12512ab7ad1766f3ad",
"manifest.json": "76f89359cfd760dafaecab1ee15fb4ad",
"version.json": "c9ee7cc3542f0086e62683e4b7f89cd8"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
