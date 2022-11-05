import { atom } from 'recoil'

const notificationAtom = atom({
    key: 'notificationAtom',
    default: { notification: 0 },
})

export default notificationAtom
