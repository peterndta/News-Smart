// Import the functions you need from the SDKs you need
import { initializeApp } from 'firebase/app'
import { getStorage } from 'firebase/storage'

// import {
//     FIREBASE_apiKey,
//     FIREBASE_authDomain,
//     FIREBASE_projectId,
//     FIREBASE_storageBucket,
//     FIREBASE_messagingSenderId,
//     FIREBASE_appId,
// } from '../config'

// Your web app's Firebase configuration
const firebaseConfig = {
    apiKey: 'AIzaSyD__mc0f_I-I_FoB-m1dyMJn4NLbD4p3DQ',
    authDomain: 'reci-images.firebaseapp.com',
    projectId: 'reci-images',
    storageBucket: 'reci-images.appspot.com',
    messagingSenderId: '73813778468',
    appId: '1:73813778468:web:ea81d407675e87f8ae78b1',
}

// Initialize Firebase
const app = initializeApp(firebaseConfig)
const storage = getStorage(app)

export { storage }
