import { get } from '../../utils/ApiCaller'

const useStatisAction = () => {
    const getStatistic = () => get({ endpoint: '/api/statis' })

    return { getStatistic }
}

export default useStatisAction
