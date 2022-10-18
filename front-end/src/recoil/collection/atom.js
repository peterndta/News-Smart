import { atom } from 'recoil'

const collectionAtom = atom({
    key: 'collectionAtom',
    default: { type: '', list: [] },
})

export default collectionAtom
