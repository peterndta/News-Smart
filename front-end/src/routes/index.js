import React, { lazy, Suspense } from 'react'

import { Redirect, Route, Switch } from 'react-router-dom'

import { AdminLayout, CommonLayout } from '../components/Layout'

import LoadingPage from '../pages/Loading'
import HybridRoute from './HybridRoute'
import PublicRoute from './PublicRoute'

const publicRoutes = [
    {
        path: '/login',
        name: 'login',
        component: lazy(() => import('../pages/Login')),
    },
]

const hybridRoutes = [
    {
        path: '/',
        name: 'home',
        component: lazy(() => import('../pages/Home')),
        layout: 'common',
    },
]

const Routes = (
    <Suspense fallback={<LoadingPage />}>
        <Switch>
            {publicRoutes.map(
                ({ layout, ...route }) =>
                    !layout && <PublicRoute key={route.name} exact={true} {...route} />
            )}
            {hybridRoutes.map(
                ({ layout, ...route }) =>
                    !layout && <HybridRoute key={route.name} exact={true} {...route} />
            )}
            <Route path="/admin">
                <AdminLayout>
                    <Suspense fallback={<LoadingPage />}>
                        <Switch>
                            {publicRoutes.map(
                                ({ layout, ...route }) =>
                                    layout === 'admin' && (
                                        <PublicRoute key={route.name} exact={true} {...route} />
                                    )
                            )}
                            {hybridRoutes.map(
                                ({ layout, ...route }) =>
                                    layout === 'admin' && (
                                        <HybridRoute key={route.name} exact={true} {...route} />
                                    )
                            )}
                            <Redirect to="/admin" />
                        </Switch>
                    </Suspense>
                </AdminLayout>
            </Route>
            <Route>
                <CommonLayout>
                    <Suspense fallback={<LoadingPage />}>
                        <Switch>
                            {publicRoutes.map(
                                ({ layout, ...route }) =>
                                    layout === 'common' && (
                                        <PublicRoute key={route.name} exact={true} {...route} />
                                    )
                            )}
                            {hybridRoutes.map(
                                ({ layout, ...route }) =>
                                    layout === 'common' && (
                                        <HybridRoute key={route.name} exact={true} {...route} />
                                    )
                            )}
                            <Redirect to="/" />
                        </Switch>
                    </Suspense>
                </CommonLayout>
            </Route>
        </Switch>
    </Suspense>
)

export default Routes
