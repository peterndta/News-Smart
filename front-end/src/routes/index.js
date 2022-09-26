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
    {
        path: '/recipes',
        name: 'recipes',
        component: lazy(() => import('../pages/Recipes')),
        layout: 'common',
    },
    {
        path: '/bookmark',
        name: 'bookmark',
        component: lazy(() => import('../pages/Bookmark')),
        layout: 'common',
    },
    {
        path: '/recipes/:id',
        name: 'recipe detail',
        component: lazy(() => import('../pages/RecipeDetail')),
        layout: 'common',
    },
    {
        path: '/my-ratings',
        name: 'rating recipes',
        component: lazy(() => import('../pages/Rating')),
        layout: 'common',
    },
    {
        path: '/profile',
        name: 'my profile',
        component: lazy(() => import('../pages/Profile')),
        layout: 'common',
    },
    {
        path: '/my-recipes',
        name: 'my Recipes',
        component: lazy(() => import('../pages/MyRecipes')),
        layout: 'common',
    },
    {
        path: '/course',
        name: 'course',
        component: lazy(() => import('../pages/Course')),
        layout: 'common',
    },
    {
        path: '/categories',
        name: 'categories',
        component: lazy(() => import('../pages/Categories')),
        layout: 'common',
    },
    {
        path: '/users-management',
        name: 'users-management',
        component: lazy(() => import('../pages/UserManagement')),
        layout: 'common',
    },
    {
        path: '/user-details',
        name: 'user-detais',
        component: lazy(() => import('../pages/UserManagement')),
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
