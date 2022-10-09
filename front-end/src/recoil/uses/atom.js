import { atom } from 'recoil'

const usesAtom = atom({
    key: 'usesAtom',
    default: { type: '', list: [] },
})

export default usesAtom
