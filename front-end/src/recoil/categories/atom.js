import { atom } from 'recoil'

const categoryAtom = atom({
    key: 'categoryAtom',
    default: { type: '', list: [] },
})

export default categoryAtom
