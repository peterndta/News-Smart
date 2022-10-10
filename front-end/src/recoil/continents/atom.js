import { atom } from 'recoil'

const continentAtom = atom({
    key: 'continentsAtom',
    default: { type: '', list: [] },
})

export default continentAtom
