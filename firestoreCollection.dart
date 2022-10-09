var result = await firestore.collection('product').get();
for (var doc in result.docs) {
  print('dsf');
}
);
