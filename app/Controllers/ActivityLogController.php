<?php

namespace App\Controllers;

use App\Models\ActivityLogModel;
use App\Controllers\BaseController;
use CodeIgniter\HTTP\ResponseInterface;

class ActivityLogController extends BaseController
{
    public function index()
    {
        $activityLogModel = new ActivityLogModel();

        $keyword = $this->request->getGet('keyword');
        $role = $this->request->getGet('role');
        $date = $this->request->getGet('date');

        $builder = $activityLogModel
            ->select('activity_logs.*, user.nama, user.email')
            ->join('user', 'user.id_user = activity_logs.id_user', 'left')
            ->orderBy('activity_logs.created_at', 'DESC');

        if ($keyword) {
            $builder->groupStart()
                ->like('activity_logs.activity', $keyword)
                ->orLike('user.nama', $keyword)
                ->orLike('user.email', $keyword)
                ->groupEnd();
        }

        if ($role) {
            $builder->where('activity_logs.role_user', $role);
        }

        if ($date) {
            $builder->where('DATE(activity_logs.created_at)', $date);
        }

        $data = [
            'title'    => 'Activity Log',
            'logs'     => $builder->findAll(),
            'keyword'  => $keyword,
            'role'     => $role,
            'date'     => $date
        ];

        return view('activity_log/index.php', $data);
    }

}
