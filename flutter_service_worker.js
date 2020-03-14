'use strict';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "/main.dart.js": "33c770a365fc552d37e600ce70c9e5bf",
"/index.html": "00fa4d0e5c5956ceb97755d9981ce3d0",
"/assets/images/1.png": "c3bed703756fcc8ca8a3d27c750fedf0",
"/assets/images/10.png": "859583af760d854c7465185f248d315c",
"/assets/images/5.png": "51826d87f48df14dc33a2555829dba1f",
"/assets/images/2.png": "98ac5de642669b194cb8c06f356f0edb",
"/assets/images/8.png": "7534cae76e0ed30dc8dffa0973f0ec89",
"/assets/images/11.png": "539bb533c62ae9636a552aa65ce9bd44",
"/assets/images/12.png": "26ac84499fe427f76ea695f27d4807e9",
"/assets/images/6.png": "31fb3998d39cb263a8e681031d17cc76",
"/assets/images/9.png": "c5a511e66d80e19e8bbdca39ad1bb1de",
"/assets/images/7.png": "1db601a78595c86958e1cc0276070c95",
"/assets/images/4.png": "96fa7b0458eaea9be0af6c04adb3b759",
"/assets/images/3.png": "06544e0c481c647d68ecd6aca6c71214",
"/assets/fonts/MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16",
"/assets/FontManifest.json": "01700ba55b08a6141f33e168c4a6c22f",
"/assets/LICENSE": "24d4f4664ee165224d7593288a372aa1",
"/assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "115e937bb829a890521f72d2e664b632",
"/assets/AssetManifest.json": "2ee42eb10ccbb78bf765eb8cd68325fc"
};

self.addEventListener('activate', function (event) {
  event.waitUntil(
    caches.keys().then(function (cacheName) {
      return caches.delete(cacheName);
    }).then(function (_) {
      return caches.open(CACHE_NAME);
    }).then(function (cache) {
      return cache.addAll(Object.keys(RESOURCES));
    })
  );
});

self.addEventListener('fetch', function (event) {
  event.respondWith(
    caches.match(event.request)
      .then(function (response) {
        if (response) {
          return response;
        }
        return fetch(event.request, {
          credentials: 'include'
        });
      })
  );
});
