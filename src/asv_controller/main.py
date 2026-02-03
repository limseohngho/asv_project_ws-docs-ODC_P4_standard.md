#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
[ODC-P4] ASV Controller Main Node
- 규칙: PEP8 준수, 하드코딩 금지, 로그 자동 기록
"""

import os
import rclpy
from rclpy.node import Node

class ASVController(Node):
    def __init__(self):
        super().__init__('asv_controller')
        
        # [가이드 준수] 하드코딩 금지: 설정값 예시
        self.declare_parameter('max_speed', 5.0)
        self.max_speed = self.get_parameter('max_speed').value
        
        self.get_logger().info('🚢 ASV 컨트롤러가 가동되었습니다.')
        self.get_logger().info(f'설정된 최대 속도: {self.max_speed} m/s')

def main(args=None):
    rclpy.init(args=args)
    node = ASVController()
    
    try:
        rclpy.spin(node)
    except KeyboardInterrupt:
        node.get_logger().info('🛑 사용자에 의해 노드가 종료되었습니다.')
    finally:
        node.destroy_node()
        rclpy.shutdown()

if __name__ == '__main__':
    main()
