import * as functions from "firebase-functions";
import * as admin from "firebase-admin";

admin.initializeApp();

export const newPostNotification = functions.firestore
  .document("posts/{postId}")
  .onCreate((snap, context) => {
    const post = snap.data();
    console.log(`New post by ${post.username}: ${post.message}`);
    return null;
  });


