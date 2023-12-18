package Business;

import java.awt.CardLayout;
import java.awt.Color;
import java.awt.Cursor;
import java.awt.Dimension;
import java.awt.EventQueue;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.swing.DefaultComboBoxModel;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JList;
import javax.swing.JPanel;
import javax.swing.JPasswordField;
import javax.swing.JPopupMenu;
import javax.swing.JScrollPane;
import javax.swing.JSeparator;
import javax.swing.JTextField;
import javax.swing.SwingConstants;
import javax.swing.UIManager;
import javax.swing.border.EtchedBorder;
import javax.swing.border.TitledBorder;
import javax.swing.plaf.metal.MetalButtonUI;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

public class DangNhap extends JFrame implements KeyListener {

	static Connection con;
	private JPanel contentPane;
	private CardLayout card;
	private JPanel panel;
	private JPanel panel_1;
	private JTextField txtUsername;
	private JPasswordField passwordField;
	private JLabel thongbaoLB;
	private JButton btnlogin;
	static ResultSet rs_taikhoan;

	static boolean action_quanlynhanvien;
	static boolean action_them;
	static boolean action_sua;
	static boolean action_xoa;
	static boolean action_nhapfile;
	static boolean action_xuatfile;
	static boolean action_banhang;

	private JPasswordField pwd;
	private JTextField textField_servername;
	private JTextField textField_login;
	private JButton btnConnect;
	private JComboBox<String> comboBox_authentication;
	private JButton btncencel;
	private JLabel lb_quaylai;
	private JPanel pn_dangnhap;
	private JPanel pn_ketnoi;
	private JLabel lbdatabaseName;
	private JTextField textField_databaseName;
	private JPopupMenu popupMenu;
//	private Custom_list server;
	private JScrollPane scrollPane_serverName;
	private JList<String> list_serverName;
	private JList list_databaseName;
	private JPopupMenu popupMenu_dataName;
	//private Custom_list dataName;

	public void run() {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					try {

						UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
					} catch (Exception e) {
						System.out.println("Look and Feel not set");
					}

					setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	public DangNhap() {
		// khoi tao gia tri
		addWindowListener(new WindowAdapter() {
			@Override
			public void windowOpened(WindowEvent e) {
				action_them = true;
				action_sua = true;
				action_xoa = true;
				action_nhapfile = true;
				action_xuatfile = true;
				action_banhang = true;
				action_quanlynhanvien = true;
//				comboBox_authentication.setSelectedItem("Windows Authentication");
//				textField_servername.setText(server.getDefault().getElementAt(server.getDefault().getSize() - 1));
//				textField_databaseName.setText(dataName.getDefault().getElementAt(dataName.getDefault().getSize() - 1));
			}
		});
		GUI();
	}

	private void GUI() {
		
		setResizable(false);
		setTitle("Login\r\n");
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 514, 479);
		
		card = new CardLayout();
		contentPane = new JPanel(card);
		setContentPane(contentPane);

		ketnoidatabase();
		
		pn_dangnhap = new JPanel();
		pn_dangnhap.setLayout(null);
		pn_dangnhap.setBackground(Color.WHITE);
		pn_dangnhap.setBorder(new TitledBorder(UIManager.getBorder("TitledBorder.border"), "", TitledBorder.LEADING,
				TitledBorder.ABOVE_TOP, null, new Color(0, 0, 0)));

		panel_1 = new JPanel();
		panel_1.setBackground(Color.WHITE);
		contentPane.add(panel_1, "dangnhap");
		panel_1.setLayout(null);

		txtUsername = new JTextField();
		txtUsername.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				txtUsername.selectAll();
				thongbaoLB.setText("");
			}
		});
		txtUsername.addKeyListener(this);
		EtchedBorder etchedBorder = new EtchedBorder(Color.WHITE, Color.WHITE);
		TitledBorder titledBorder = new TitledBorder(etchedBorder);
		txtUsername.setBorder(titledBorder);
		txtUsername.setHorizontalAlignment(SwingConstants.CENTER);
		txtUsername.setText("");
		txtUsername.setBounds(135, 75, 244, 45);
		txtUsername.setBackground(Color.WHITE);
		txtUsername.setFont(new Font("Arial", Font.PLAIN, 22));
		txtUsername.setColumns(18);
		panel_1.add(txtUsername);

		passwordField = new JPasswordField(""); // ****

		passwordField.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				passwordField.selectAll();
			}
		});
		passwordField.addKeyListener(this);
		etchedBorder = new EtchedBorder(Color.WHITE, Color.WHITE);
		titledBorder = new TitledBorder(etchedBorder);
		passwordField.setBorder(titledBorder);
		passwordField.setHorizontalAlignment(SwingConstants.CENTER);
		passwordField.setBounds(135, 140, 244, 45);
		passwordField.setBackground(Color.WHITE);
		passwordField.setFont(new Font("Arial", Font.PLAIN, 22));
		passwordField.setColumns(18);
		panel_1.add(passwordField);

		thongbaoLB = new JLabel("");
		thongbaoLB.setForeground(new Color(178, 34, 34));
		thongbaoLB.setDisplayedMnemonic('*');
		thongbaoLB.setBounds(100, 225, 318, 32);
		thongbaoLB.setFont(new Font("Arial", Font.PLAIN, 20));
		panel_1.add(thongbaoLB);

		btnlogin = new JButton("Log in");
		btnlogin.setUI(new MetalButtonUI() {
			@Override
			protected Color getSelectColor() {
				return new Color(0, 60, 108);
			}
		});
		btnlogin.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				kiemtradangnhap();
			}
		});
		btnlogin.setFocusable(false);
		btnlogin.addKeyListener(this);
		etchedBorder = new EtchedBorder(Color.WHITE, Color.WHITE);
		titledBorder = new TitledBorder(etchedBorder);
		btnlogin.setBorder(titledBorder);
		btnlogin.setForeground(new Color(252, 255, 255));
		btnlogin.setBackground(new Color(34, 67, 156));
		btnlogin.setFont(new Font("Tahoma", Font.PLAIN, 35));
		btnlogin.setBounds(130, 300, 250, 60);
		panel_1.add(btnlogin);

		JSeparator separator = new JSeparator();
		separator.setForeground(Color.BLACK);
		separator.setBounds(85, 120, 325, 5);
		panel_1.add(separator);

		JSeparator separator_1 = new JSeparator();
		separator_1.setForeground(Color.BLACK);
		separator_1.setBounds(85, 189, 325, 5);
		panel_1.add(separator_1);

		JLabel lbuser = new JLabel("");
		lbuser.setIcon(new ImageIcon("Imager\\male_user_32px.png"));
		lbuser.setBounds(85, 75, 35, 35);

		panel_1.add(lbuser);

		JLabel lbpass = new JLabel();
		lbpass.setIcon(new ImageIcon("Imager\\unlock_32px.png"));
		lbpass.setBounds(85, 150, 35, 32);

		panel_1.add(lbpass);				
		
		JLabel lblNewLabel = new JLabel("Phương Nam");
		lblNewLabel.setForeground(new Color(22, 27, 33));
		lblNewLabel.setFont(new Font("Arial", Font.BOLD, 20));
		lblNewLabel.setBackground(Color.WHITE);
		lblNewLabel.setBounds(175, 6, 158, 56);
		panel_1.add(lblNewLabel);


		lb_quaylai = new JLabel("");
		lb_quaylai.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
		lb_quaylai.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				if (e.getButton() == MouseEvent.BUTTON1) {
					showlayout("ketnoi");
				}
			}
		});
		lb_quaylai.setIcon(new ImageIcon("Imager\\back_25px.png"));
		lb_quaylai.setBounds(23, 13, 35, 32);
		panel_1.add(lb_quaylai);

	}

	private void authentication() {
		int index = comboBox_authentication.getSelectedIndex();
		if (index == 0) {
			textField_login.setEditable(false);
			pwd.setEditable(false);

		} else if (index == 1) {
			textField_login.setEditable(true);
			pwd.setEditable(true);
		}
	}

	public void ketnoidatabase() {
		connectSQL c = null;
		c = new connectSQL();
		con = c.connect();
	}

	@Override
	public void keyTyped(KeyEvent e) {
	}

	@Override
	public void keyPressed(KeyEvent e) {
		if (e.getKeyCode() == e.VK_ENTER) {
			if (pn_ketnoi.isVisible()) {
				ketnoidatabase();
				if (con != null) {
					showlayout("dangnhap");
					txtUsername.requestFocus();
				}
			} else if (pn_dangnhap.isVisible()) {
				kiemtradangnhap();
			}
		}
	}

	@Override
	public void keyReleased(KeyEvent e) {
	}

	private void showlayout(String name) {
		card.show(contentPane, name);
	}

	private void kiemtradangnhap() {
		String sql = "use " + "quanlybanhang"
				+ " select * from  nhanvien n left join phanquyen p on n.manhanvien = p.manhanvien where n.manhanvien =? and n.MatKhau =? and p.hoatdong= 1";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, txtUsername.getText());
			ps.setString(2, passwordField.getText());

			rs_taikhoan = ps.executeQuery();
			if (!rs_taikhoan.next()) {
				thongbaoLB.setText("Sai tên đăng nhập hoặc mật khẩu");
			} else {
				hoatdong(kiemtra_quyenhan());
				dispose(); // dong jframe
				MenuChinh menuchinh = new MenuChinh();
				menuchinh.run();
				// them
			}
		} catch (Exception ex) {
			System.err.println("dang nhap.java: kiemtradangnhap: " + ex.getMessage());
		}
	}

	static String kiemtra_quyenhan() {
		String sql = "SELECT distinct ct.ChucNang FROM NhanVien N JOIN PhanQuyen P ON P.MaNhanVien = N.MaNhanVien JOIN QuyenHan Q ON Q.MaQuyenHan = P.MaQuyenHan JOIN ChiTietQuyenHan CT ON CT.MaQuyenHan = Q.MaQuyenHan WHERE N.MaNhanVien = ? AND p.hoatdong  = 1 AND CT.ChoPhep =1";
		String qh = "";
		try {

			PreparedStatement pr = con.prepareStatement(sql);
			pr.setString(1, rs_taikhoan.getString("manhanvien"));

			ResultSet rs = pr.executeQuery();
			while (rs.next()) {
				qh += rs.getString(1).toLowerCase(); // chuyen tat ca ve chu thuong
				qh += "/";
			}
			rs.close();
		} catch (Exception e) {
			System.err.println("dang nhap.java  kiemtraquyenhan: " + e.getMessage());
		}
		return qh;
	}

	private void hoatdong(String qh) {

		if (qh.toLowerCase().contains("thêm") == false) {

			action_them = false;
		}
		if (qh.toLowerCase().contains("xóa") == false) {

			action_xoa = false;
		}
		if (qh.toLowerCase().contains("sửa") == false) {

			action_sua = false;
		}
		if (qh.toLowerCase().contains("nhập file") == false) {

			action_nhapfile = false;
		}
		if (qh.toLowerCase().contains("xuất file") == false) {

			action_xuatfile = false;
		}
		if (qh.toLowerCase().contains("bán hàng") == false) {
			action_banhang = false;
		}
		if (qh.toLowerCase().contains("quản lý nhân viên") == false) {
			action_quanlynhanvien = false;
		}
		System.out.println("nhan vien có quyền hạn: " + qh);
	}
}
