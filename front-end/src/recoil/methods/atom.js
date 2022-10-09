import { atom } from 'recoil'

const methodsAtom = atom({
    key: 'methodsAtom',
    default: { type: '', list: [] },
})

export default methodsAtom
